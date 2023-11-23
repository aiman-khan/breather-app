import 'package:breather_app/utils/resource/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppNameWidget extends StatelessWidget {
  const AppNameWidget({
    super.key,
    this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Breather',
      style: TextStyle(
        fontSize: 35.27.sp,
        color: color ?? R.colors.blue173777,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
