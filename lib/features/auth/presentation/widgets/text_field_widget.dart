import 'package:breather_app/utils/resource/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.validator,
    required this.hintText,
    this.isObscureText = false,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;
  final bool isObscureText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 542.w,
      child: Stack(
        children: [
          Container(
            width: 542.w,
            height: 85.h,
            padding: EdgeInsets.symmetric(
              horizontal: 32.w,
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
              ),
              hintStyle: GoogleFonts.roboto(
                fontSize: 28.sp,
                color: R.colors.greyC8CDCF,
                fontWeight: FontWeight.w500,
              ),
              // errorBorder: InputBorder.none,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(45.r),
                borderSide: BorderSide(
                  strokeAlign: BorderSide.strokeAlignOutside,
                  width: 1,
                  color: R.colors.greyC8CDCF.withOpacity(0.4),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(45.r),
                borderSide: BorderSide(
                  strokeAlign: BorderSide.strokeAlignOutside,
                  width: 1,
                  color: R.colors.greyC8CDCF.withOpacity(0.4),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(45.r),
                borderSide: BorderSide(
                  strokeAlign: BorderSide.strokeAlignOutside,
                  width: 1,
                  color: R.colors.greyC8CDCF.withOpacity(0.4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
