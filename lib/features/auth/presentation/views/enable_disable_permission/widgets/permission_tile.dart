import 'package:breather_app/common/extensions/num.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PermissionTile extends StatelessWidget {
  const PermissionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.description,
    required this.isEnabled,
  });

  final String icon;
  final String title;
  final String description;

  final VoidCallback onTap;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.7.r),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF97B9EB),
            Color(0xFFC2D4EE),
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(icon),
              11.92.wb,
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: R.colors.blue173776,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  width: 50.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: isEnabled
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 32.r,
                        height: 32.r,
                        margin: EdgeInsets.symmetric(
                          horizontal: 0.5.w,
                          vertical: 2.h,
                        ),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF82adeb),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          13.61.hb,
          Text(
            description,
            style: TextStyle(
              fontSize: 11.sp,
              color: Color(0xFF717171),
            ),
          ),
        ],
      ),
    );
  }
}
