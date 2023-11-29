import 'package:breather_app/common/extensions/num.dart';
import 'package:breather_app/common/widgets/app_name_widget.dart';
import 'package:breather_app/common/widgets/filled_app_button.dart';
import 'package:breather_app/features/auth/domain/models/user/user.dart';
import 'package:breather_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:breather_app/features/auth/domain/usecases/save_user_usecase.dart';
import 'package:breather_app/features/auth/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:breather_app/features/auth/presentation/providers/user_firestore_provider.dart';
import 'package:breather_app/features/auth/presentation/providers/user_provider.dart';
import 'package:breather_app/features/auth/presentation/widgets/text_field_widget.dart';
import 'package:breather_app/utils/di/di.dart';
import 'package:breather_app/utils/exceptions/exceptions.dart';
import 'package:breather_app/utils/loading/loading.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:breather_app/utils/router/paths.dart';
import 'package:breather_app/utils/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final _formKey = GlobalKey<FormState>();

  final inputUsernameController = TextEditingController();
  final inputPasswordController = TextEditingController();

  bool _isTermsAccepted = false;

  bool showPassword = false;

  Future<void> _login() async {
    final loginUsecase = sl<LoginUsecase>();

    final input = LoginUsecaseInput(
      password: inputPasswordController.text,
      email: inputUsernameController.text,
    );

    if (_formKey.currentState?.validate() ?? false) {
      loading(context);

      try {
        final output = await loginUsecase(input);

        ref.read(userProvider.notifier).setUser(output.user);

        final firestoreUser = await ref.read(userFirestoreProvider.future);

        if (firestoreUser != null) {
          ref.read(userProvider.notifier).setUser(firestoreUser);
          await _saveUser(firestoreUser);
        }

        if (mounted) {
          GoRouter.of(context).pushReplacement(RoutePaths.home);
        }
      } on MessageException catch (e) {
        showToast(e.message);
      } on SomethingWentWrongException {
        showToast('Something went wrong');
      } catch (e) {
        showToast('An error has occurred');
      } finally {
        dismissLoading();
      }
    }
  }

  Future<void> _saveUser(UserModel user) async {
    final saveUserUsecase = sl<SaveUserUsecase>();
    final input = SaveUserUsecaseInput(user: user);
    await saveUserUsecase(input);
  }

  Future<void> _signInWithGoogle() async {
    final signInWithGoogleUsecase = sl<SignInWithGoogleUsecase>();
    final input = SignInWithGoogleUsecaseInput();

    try {
      loading(context);
      final output = await signInWithGoogleUsecase(input);
      ref.read(userProvider.notifier).setUser(output.user);

      await _saveUser(output.user);

      if (mounted) {
        GoRouter.of(context).push(RoutePaths.home);
      }
    } on MessageException catch (e) {
      showToast(e.message);
    } on SomethingWentWrongException {
      showToast('Something went wrong');
    } catch (e) {
      showToast('Something went wrong');
    } finally {
      dismissLoading();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  R.colors.whiteFDFDFE,
                  R.colors.blue669BE7,
                ],
              ),
            ),
          ),
          Positioned(
            top: -92.h,
            child: SizedBox(
              height: 433.h,
              width: 211.h,
              child: Image.asset(R.images.appLogo),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 33.h,
              left: 30.w,
              right: 30.w,
            ),
            child: SizedBox(
              height: 800.h,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      /// [App Name]
                      const AppNameWidget(),

                      211.hb,

                      TextFieldWidget(
                        label: 'Email',
                        controller: inputUsernameController,
                        validator: (v) {
                          if (v?.isEmpty ?? true) {
                            return 'Email is required';
                          }
                          final emailRegex =
                              RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
                          final isValid = emailRegex.hasMatch(v!);

                          if (!isValid) {
                            return 'Email is not valid';
                          }
                          return null;
                        },
                        hintText: 'Email',
                      ),

                      25.hb,

                      /// [Password Field]
                      TextFieldWidget(
                        label: 'Password',
                        controller: inputPasswordController,
                        isObscureText: !showPassword,
                        validator: (password) {
                          if (password?.isEmpty ?? true) {
                            return 'Password is required';
                          } else if (password!.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                        hintText: 'Password',
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          child: Icon(
                            showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 18.r,
                            color: R.colors.grey828384,
                          ),
                        ),
                      ),

                      6.hb,

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /// [Create Account]
                            InkWell(
                              onTap: () => GoRouter.of(context)
                                  .push(RoutePaths.register),
                              child: Text(
                                'Create an account',
                                style: TextStyle(
                                  fontSize: 9.6.sp,
                                  color: R.colors.blue151A5E,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                            42.wb,

                            /// [Forget Password]
                            InkWell(
                              onTap: () => GoRouter.of(context)
                                  .push(RoutePaths.forgetPassword),
                              child: Text(
                                'Forget Password',
                                style: TextStyle(
                                  fontSize: 9.6.sp,
                                  color: R.colors.blue151A5E,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      35.hb,

                      /// [Login Button]
                      FilledAppButton(
                        text: 'Login',
                        onTap: _login,
                        width: 222.7.w,
                        height: 40.h,
                        fontSize: 13.22.sp,
                      ),

                      18.hb,

                      /// [Or]
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: R.colors.black,
                            height: 0.8.h,
                            width: 75.w,
                          ),
                          16.wb,
                          Text(
                            'OR',
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: R.colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          16.wb,
                          Container(
                            color: R.colors.black,
                            height: 0.8.h,
                            width: 75.w,
                          )
                        ],
                      ),

                      18.hb,

                      /// [Sign in with Google]
                      FilledButton(
                        onPressed: _signInWithGoogle,
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(R.colors.white),
                          fixedSize:
                              MaterialStateProperty.all(Size(222.7.w, 40.h)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              R.images.googleLogo,
                              height: 27.r,
                              width: 27.r,
                            ),
                            6.wb,
                            Text(
                              'Sign in with Google',
                              style: TextStyle(
                                color: R.colors.black,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),

                      12.hb,

                      InkWell(
                        onTap: () => GoRouter.of(context)
                            .push(RoutePaths.interestSelection),
                        child: Text(
                          'Skip for this time',
                          style: TextStyle(
                            color: R.colors.white,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),

                      11.5.hb,

                      InkWell(
                        onTap: () {
                          setState(() {
                            _isTermsAccepted = !_isTermsAccepted;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              _isTermsAccepted
                                  ? Icons.check_circle_outline
                                  : Icons.circle_outlined,
                              size: 15.r,
                              color: R.colors.white,
                            ),
                            12.wb,
                            SizedBox(
                              width: 200.w,
                              child: Text(
                                'By continuing you accept our Privacy Policy and Term of Use',
                                style: TextStyle(
                                  fontSize: 8.7.sp,
                                  color: R.colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
