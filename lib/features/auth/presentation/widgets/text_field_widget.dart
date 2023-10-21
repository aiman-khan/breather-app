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
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.roboto(
            fontSize: 28.sp,
            color: R.colors.greyC8CDCF,
            fontWeight: FontWeight.w500,
          ),
          border: InputBorder.none, // Remove the default border
        ),
      ),
    );
  }
}
