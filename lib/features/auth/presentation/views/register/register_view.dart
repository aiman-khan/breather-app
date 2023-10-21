import 'package:breather_app/common/extensions/num.dart';
import 'package:breather_app/common/widgets/app_name_widget.dart';
import 'package:breather_app/common/widgets/filled_app_button.dart';
import 'package:breather_app/features/auth/presentation/widgets/success_message_widget.dart';
import 'package:breather_app/features/auth/presentation/widgets/text_field_widget.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final inputUsernameController = TextEditingController();
  final inputPasswordController = TextEditingController();
  final inputConfirmPasswordController = TextEditingController();
  final inputEmailController = TextEditingController();

  bool isTermsAccepted = false;

  void _signUp() {
    _showSuccess();
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
                child: Lottie.network(
                    "https://lottie.host/25891627-18a0-41b3-87a4-eec9225fbc71/ZtWjGoJ6Na.json"),
              ),

              11.hb,

              TextFieldWidget(
                controller: inputUsernameController,
                validator: (v) {
                  return null;
                },
                hintText: 'Enter your name',
              ),

              25.hb,

              /// [Email]
              TextFieldWidget(
                controller: inputEmailController,
                validator: (v) {
                  return null;
                },
                hintText: 'Enter your name',
              ),

              25.hb,

              /// [Password Field]
              TextFieldWidget(
                controller: inputPasswordController,
                validator: (v) {
                  return null;
                },
                hintText: 'Enter password',
              ),
              25.hb,

              /// [Confirm Password Field]
              TextFieldWidget(
                controller: inputPasswordController,
                validator: (v) {
                  return null;
                },
                hintText: 'Re-enter password',
              ),

              42.hb,

              GestureDetector(
                onTap: () {
                  setState(() {
                    isTermsAccepted = !isTermsAccepted;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      isTermsAccepted
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
    );
  }
}
