import 'package:breather_app/common/extensions/num.dart';
import 'package:breather_app/features/schedular/presentation/providers/schedular_provider/selected_schedule_date_provider.dart';
import 'package:breather_app/features/schedular/presentation/views/session_schedular/widgets/schedular_calendar_widget.dart';
import 'package:breather_app/features/schedular/presentation/views/session_schedular/widgets/time_tiles_widget.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SessionSchedularView extends StatelessWidget {
  const SessionSchedularView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  R.colors.whiteFDFDFE,
                  R.colors.blue669BE7,
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                children: [
                  19.7.hb,
                  Align(
                    alignment: Alignment.topLeft,
                    child: BackButton(
                      color: R.colors.black,
                    ),
                  ),
                  12.hb,
                  Consumer(
                    builder: (context, ref, _) {
                      final date = ref.watch(selectedScheduleDateProvider);

                      return Column(
                        children: [
                          Text(
                            date != null ? 'Schedular' : 'Session Schedular',
                            style: TextStyle(
                              fontSize: 22.sp,
                              color: R.colors.blue19214C,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          10.hb,
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            child: Text(
                              date != null
                                  ? 'Tap on session to adjust the time '
                                  : 'Tap on calendar to adjust the session',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: R.colors.grey6F6F6F,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          32.hb,
                          Text(
                            'Consistent breathing exercises can improve focus and reduce stress. Schedule your next session now!',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: R.colors.blue19214C,
                              fontWeight: FontWeight.w500,
                              height: 1.3,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          24.hb,
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            child: date != null
                                ? const TimeTilesWidget()
                                : const SchedularCalendarWidget(),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
