import 'package:breather_app/common/extensions/num.dart';
import 'package:breather_app/common/widgets/filled_app_button.dart';
import 'package:breather_app/features/auth/presentation/views/forget_password/enter_new_password_view.dart';
import 'package:breather_app/features/auth/presentation/widgets/text_field_widget.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final _inputEmail = TextEditingController();

  void _submit() {
    _navigate();
  }

  void _navigate() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const EnterNewPasswordView();
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
                  'Enter your e-mail',
                  style: TextStyle(
                    fontSize: 45.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                45.hb,
                Text(
                  'You will receive a link to confirm the password change to the e-mail address provided',
                  style: TextStyle(
                    fontSize: 28.sp,
                    color: R.colors.black.withOpacity(0.6),
                  ),
                  textAlign: TextAlign.center,
                ),

                86.hb,

                /// [Email Text Field]
                TextFieldWidget(
                  controller: _inputEmail,
                  validator: (v) {
                    return null;
                  },
                  hintText: 'Enter your e-mail',
                ),

                138.hb,

                FilledAppButton(
                  text: 'Confirm Email',
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
