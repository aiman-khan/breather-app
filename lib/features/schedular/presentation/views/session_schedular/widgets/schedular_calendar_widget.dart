import 'package:breather_app/features/schedular/presentation/providers/schedular_provider/selected_schedule_date_provider.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class SchedularCalendarWidget extends ConsumerWidget {
  const SchedularCalendarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.only(top: 18.6.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9.5.r),
        color: R.colors.white,
      ),
      child: SfCalendar(
        view: CalendarView.month,
        onTap: (calendar) {
          ref.read(selectedScheduleDateProvider.notifier).state = calendar.date;
        },
        todayHighlightColor: R.colors.blue14306D,
        selectionDecoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: const Color(0xff45539D), width: 2),
          shape: BoxShape.rectangle,
        ),
        headerStyle: CalendarHeaderStyle(
          textStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
        showNavigationArrow: true,
      ),
    );
  }
}
