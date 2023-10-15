import 'package:breather_app/common/extensions/num.dart';
import 'package:breather_app/common/widgets/filled_app_button.dart';
import 'package:breather_app/features/auth/presentation/widgets/success_message_widget.dart';
import 'package:breather_app/features/auth/presentation/widgets/text_field_widget.dart';
import 'package:breather_app/features/auth/presentation/widgets/welcome_widget.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnterNewPasswordView extends StatefulWidget {
  const EnterNewPasswordView({super.key});

  @override
  State<EnterNewPasswordView> createState() => _EnterNewPasswordViewState();
}

class _EnterNewPasswordViewState extends State<EnterNewPasswordView> {
  final _inputPassword = TextEditingController();
  final _inputConfirmPassword = TextEditingController();

  void _submit() {
    _showSuccess();
  }

  void _showSuccess() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return SuccessMessageWidget(
            message:
                'Congratulations!\nYour password has been changed successfully',
            onDone: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const WelcomeWidget();
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 96.w,
              vertical: 186.h,
            ),
            child: Column(
              children: [
                Text(
                  'Enter new password',
                  style: TextStyle(
                    fontSize: 45.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),

                166.hb,

                /// [Password Text Field]
                TextFieldWidget(
                  controller: _inputPassword,
                  validator: (v) {
                    return null;
                  },
                  hintText: 'Enter your password',
                ),

                40.hb,

                /// [Confirm PAssword Text Field]
                TextFieldWidget(
                  controller: _inputConfirmPassword,
                  validator: (v) {
                    return null;
                  },
                  hintText: 'Re-enter your password',
                ),

                70.hb,

                FilledAppButton(
                  text: 'Confirm Password',
                  onTap: _submit,
                  color: R.colors.blue42C4FB,
                  width: 194.w,
                  height: 62.h,
                  fontSize: 25.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
