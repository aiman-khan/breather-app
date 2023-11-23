import 'package:breather_app/common/extensions/num.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.validator,
    required this.hintText,
    required this.label,
    this.suffixIcon,
    this.isObscureText = false,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;
  final bool isObscureText;
  final String label;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 12.sp,
                color: R.colors.black,
                fontWeight: FontWeight.w700),
            // ,
          ),
        ),
        4.hb,
        SizedBox(
          width: 265.w,
          child: Stack(
            children: [
              Container(
                width: 265.w,
                height: 46.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 32.w,
                  vertical: 8.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45.r),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: R.colors.greyEDECEC,
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset: const Offset(2.0, 3.0),
                    )
                  ],
                ),
              ),
              TextFormField(
                controller: controller,
                validator: validator,
                obscureText: isObscureText,
                decoration: InputDecoration(
                  hintText: hintText,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 14.h,
                  ),
                  hintStyle: TextStyle(
                    fontSize: 10.sp,
                    color: R.colors.greyC8CDCF,
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  suffixIcon: suffixIcon,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
