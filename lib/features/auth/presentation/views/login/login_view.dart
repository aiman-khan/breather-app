import 'package:breather_app/common/extensions/num.dart';
import 'package:breather_app/common/widgets/app_name_widget.dart';
import 'package:breather_app/common/widgets/filled_app_button.dart';
import 'package:breather_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:breather_app/features/auth/domain/usecases/sign_in_with_google_usecase.dart';
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
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final _formKey = GlobalKey<FormState>();

  final inputUsernameController = TextEditingController();
  final inputPasswordController = TextEditingController();

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

        if (mounted) {
          GoRouter.of(context).push(RoutePaths.home);
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

  Future<void> _signInWithGoogle() async {
    final signInWithGoogleUsecase = sl<SignInWithGoogleUsecase>();
    final input = SignInWithGoogleUsecaseInput();

    try {
      loading(context);
      final output = await signInWithGoogleUsecase(input);
      ref.read(userProvider.notifier).setUser(output.user);
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 79.h,
            horizontal: 30.w,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  /// [Back]
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () => GoRouter.of(context).pop(),
                      child: Icon(
                        Icons.chevron_left,
                        size: 78.r,
                      ),
                    ),
                  ),

                  /// [App Name]
                  const AppNameWidget(),

                  14.hb,

                  /// [Lottie Animation]
                  SizedBox(
                    height: 288.h,
                    width: 288.w,
                    child: Lottie.asset(
                      R.lotties.welcomeAnimation,
                    ),
                  ),
                  11.hb,

                  TextFieldWidget(
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
                    controller: inputPasswordController,
                    isObscureText: true,
                    validator: (password) {
                      if (password?.isEmpty ?? true) {
                        return 'Password is required';
                      } else if (password!.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    hintText: 'Password',
                  ),

                  21.hb,

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 86.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// [Create Account]
                        InkWell(
                          onTap: () =>
                              GoRouter.of(context).push(RoutePaths.register),
                          child: Text(
                            'Create an account',
                            style: TextStyle(
                              fontSize: 19.sp,
                              color: R.colors.blue0460EA,
                            ),
                          ),
                        ),

                        /// [Forget Password]
                        InkWell(
                          onTap: () => GoRouter.of(context)
                              .push(RoutePaths.forgetPassword),
                          child: Text(
                            'Forget Password',
                            style: TextStyle(
                              fontSize: 19.sp,
                              color: R.colors.blue0460EA,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  87.hb,

                  /// [Login Button]
                  FilledAppButton(
                    text: 'Login',
                    onTap: _login,
                    width: 194.w,
                    height: 62.h,
                    fontSize: 25.sp,
                  ),

                  116.hb,

                  /// [Or]
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: R.colors.black,
                        height: 1.2.h,
                        width: 199.w,
                      ),
                      39.wb,
                      Text(
                        'OR',
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: R.colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      39.wb,
                      Container(
                        color: R.colors.black,
                        height: 1.2.h,
                        width: 199.w,
                      )
                    ],
                  ),

                  77.hb,

                  /// [Sign in with Google]
                  FilledButton(
                    onPressed: _signInWithGoogle,
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(R.colors.redF55E5E),
                      fixedSize: MaterialStateProperty.all(Size(503.w, 88.h)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          R.pngs.googleLogo,
                          height: 60.r,
                          width: 60.r,
                        ),
                        15.wb,
                        Text(
                          'Sign in with Google',
                          style: TextStyle(
                            color: R.colors.white,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
