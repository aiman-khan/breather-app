import 'package:breather_app/common/extensions/num.dart';
import 'package:breather_app/common/widgets/app_name_widget.dart';
import 'package:breather_app/common/widgets/filled_app_button.dart';
import 'package:breather_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:breather_app/features/auth/presentation/providers/user_provider.dart';
import 'package:breather_app/features/auth/presentation/widgets/success_message_widget.dart';
import 'package:breather_app/features/auth/presentation/widgets/text_field_widget.dart';
import 'package:breather_app/utils/di/di.dart';
import 'package:breather_app/utils/exceptions/exceptions.dart';
import 'package:breather_app/utils/loading/loading.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:breather_app/utils/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  final _formKey = GlobalKey<FormState>();

  final _inputUsernameController = TextEditingController();
  final _inputPasswordController = TextEditingController();
  final _inputConfirmPasswordController = TextEditingController();
  final _inputEmailController = TextEditingController();

  bool _isTermsAccepted = false;

  Future<void> _signUp() async {
    if (_formKey.currentState?.validate() ?? false) {
      final registerUsecase = sl<RegisterUsecase>();

      final input = RegisterUsecaseInput(
        name: _inputUsernameController.text,
        email: _inputEmailController.text,
        password: _inputPasswordController.text,
      );

      try {
        loading(context);
        final output = await registerUsecase(input);
        ref.read(userProvider.notifier).setUser(output.user);
        _showSuccess();
      } on MessageException catch (e) {
        showToast(e.message);
      } on SomethingWentWrongException {
        showToast('Something went wrong');
      } catch (e) {
        showToast('Something went wrong');
      } finally {
        dismissLoading();
      }
    } else {
      showToast('Please accept terms and conditions');
    }
  }

  void _showSuccess() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return SuccessMessageWidget(
            message:
                'Congratulations!\nYour account has been created successfully',
            onDone: () {},
          );
        },
      ),
    );
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
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
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
                    controller: _inputUsernameController,
                    validator: (v) {
                      if (v?.isEmpty ?? true) {
                        return 'Name is required';
                      }
                      return null;
                    },
                    hintText: 'Enter your name',
                  ),

                  25.hb,

                  /// [Email]
                  TextFieldWidget(
                    controller: _inputEmailController,
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
                    hintText: 'Enter your email',
                  ),

                  25.hb,

                  /// [Password Field]
                  TextFieldWidget(
                    controller: _inputPasswordController,
                    validator: (password) {
                      if (password?.isEmpty ?? true) {
                        return 'Password is required';
                      } else if (password!.length < 6) {
                        return 'Password must be at least 6 characters';
                      } else {
                        if (password != _inputConfirmPasswordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      }
                    },
                    hintText: 'Enter password',
                  ),
                  25.hb,

                  /// [Confirm Password Field]
                  TextFieldWidget(
                    controller: _inputConfirmPasswordController,
                    validator: (confirmPassword) {
                      if (confirmPassword?.isEmpty ?? true) {
                        return 'Please confirm your password';
                      } else if (confirmPassword !=
                          _inputPasswordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    hintText: 'Re-enter password',
                  ),

                  42.hb,

                  GestureDetector(
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
                          size: 42.r,
                        ),
                        12.wb,
                        SizedBox(
                          width: 400.w,
                          child: Text(
                            'By continuing you accept our Privacy Policy and Term of Use',
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: R.colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  87.hb,

                  /// [Login Button]
                  FilledAppButton(
                    text: 'Sign Up',
                    onTap: _signUp,
                    color: R.colors.blue42C4FB,
                    width: 194.w,
                    height: 62.h,
                    fontSize: 25.sp,
                  ),

                  116.hb,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
