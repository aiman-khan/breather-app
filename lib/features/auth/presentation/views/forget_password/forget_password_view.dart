import 'package:breather_app/common/extensions/num.dart';
import 'package:breather_app/common/widgets/filled_app_button.dart';
import 'package:breather_app/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:breather_app/features/auth/presentation/widgets/success_message_widget.dart';
import 'package:breather_app/features/auth/presentation/widgets/text_field_widget.dart';
import 'package:breather_app/utils/di/di.dart';
import 'package:breather_app/utils/exceptions/exceptions.dart';
import 'package:breather_app/utils/loading/loading.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:breather_app/utils/router/paths.dart';
import 'package:breather_app/utils/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final _inputEmail = TextEditingController();

  Future<void> _submit() async {
    final resetPasswordUsecase = sl<ResetPasswordUsecase>();
    final input = ResetPasswordUsecaseInput(email: _inputEmail.text);

    try {
      loading(context);
      final output = await resetPasswordUsecase(input);
      if (output.isSuccess) {
        _navigate();
      }
    } on MessageException catch (e) {
      showToast(e.message);
    } on SomethingWentWrongException {
      showToast('Something Went Wrong');
    } catch (e) {
      showToast("An error has occurred");
    } finally {
      dismissLoading();
    }
  }

  void _navigate() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return SuccessMessageWidget(
            message:
                'Congratulations! Your password has been changed successfully.',
            onDone: () {
              GoRouter.of(context).pushReplacement(RoutePaths.login);
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
          SafeArea(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 186.h,
                  horizontal: 27.w,
                ),
                child: Column(
                  children: [
                    Text(
                      'Enter your e-mail',
                      style: TextStyle(
                        fontSize: 22.37.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    45.hb,
                    Text(
                      'You will receive a link to confirm the password change to the e-mail address provided',
                      style: TextStyle(
                        fontSize: 13.134.sp,
                        color: R.colors.black.withOpacity(0.6),
                      ),
                      textAlign: TextAlign.center,
                    ),

                    34.hb,

                    /// [Email Text Field]
                    TextFieldWidget(
                      controller: _inputEmail,
                      label: '',
                      validator: (v) {
                        return null;
                      },
                      hintText: 'Enter your e-mail',
                    ),

                    61.5.hb,

                    FilledAppButton(
                      text: 'Confirm Email',
                      onTap: _submit,
                      width: 113.w,
                      height: 35.h,
                      fontSize: 12.62.sp,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
