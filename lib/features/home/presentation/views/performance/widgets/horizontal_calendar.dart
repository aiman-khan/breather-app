import 'package:breather_app/utils/resource/r.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class DatePickerCustom extends ConsumerStatefulWidget {
  const DatePickerCustom({Key? key}) : super(key: key);

  @override
  ConsumerState<DatePickerCustom> createState() => _DatePickerCustomState();
}

class _DatePickerCustomState extends ConsumerState<DatePickerCustom> {
  int selectedIndex = 0;
  late DateTime lastDayOfMonth;
  late List<DateTime> dateList;

  late final DateTime now;

  late DateTime startDate;
  late DateTime endDate;

  @override
  void initState() {
    super.initState();
    now = DateTime.now();
    startDate = now.subtract(const Duration(days: 5));
    endDate = now.add(const Duration(days: 5));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          controller: ScrollController(
            initialScrollOffset: 32.r * 5, // Scroll to today
          ),
          child: Row(
            children: List.generate(
              endDate.difference(startDate).inDays + 1,
              (index) {
                final currentDate = startDate.add(Duration(days: index));
                final currentDay = now.day;

                final dayName = DateFormat('E').format(currentDate);

                return Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 6.w : 0.0,
                    right: 6.w,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        currentDate.isAtSameMomentAs(now)
                            ? 'Today'
                            : dayName.substring(0, 1),
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: currentDate.isAtSameMomentAs(now)
                              ? R.colors.black
                              : R.colors.grey818181,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        height: 32.r,
                        width: 32.r,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: currentDate.isAtSameMomentAs(now)
                              ? Colors.white
                              : index == currentDay
                                  ? Colors.white
                                  : Colors.transparent,
                          borderRadius: BorderRadius.circular(44.0),
                        ),
                        child: Text(
                          "${currentDate.day}",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: R.colors.grey818181,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
