import 'package:breather_app/common/extensions/num.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InterestCardWidget extends StatefulWidget {
  const InterestCardWidget({super.key});

  @override
  State<InterestCardWidget> createState() => _InterestCardWidgetState();
}

class _InterestCardWidgetState extends State<InterestCardWidget> {
  List<Interest> interests = [
    Interest('Focus', false),
    Interest('Mood', false),
    Interest('Relax', false),
    Interest('Anxiety', false),
  ];

  void toggleSelection(int index) {
    setState(() {
      interests[index].isSelected = !interests[index].isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildOption(0),
          18.hb,
          buildOption(1),
          18.hb,
          buildOption(2),
          18.hb,
          buildOption(3),
        ],
      ),
    );
  }

  Widget buildOption(int index) {
    return InkWell(
      onTap: () => toggleSelection(index),
      child: Container(
        width: 162.w,
        height: 43.h,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        decoration: BoxDecoration(
          border: Border.all(
            color: R.colors.blue151A5E,
            width: 1.5.w,
          ),
          borderRadius: BorderRadius.circular(52.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              interests[index].title,
              style: TextStyle(
                fontSize: 20.8.sp,
                color: R.colors.blue151A5E,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            Icon(
              interests[index].isSelected
                  ? Icons.check_circle_outline
                  : Icons.circle_outlined,
              size: 20.8.r,
              color: R.colors.blue151A5E,
            )
          ],
        ),
      ),
    );
  }
}

class Interest {
  String title;
  bool isSelected;

  Interest(this.title, this.isSelected);
}
