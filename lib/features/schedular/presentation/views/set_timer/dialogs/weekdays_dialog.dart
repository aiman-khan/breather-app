import 'package:breather_app/common/extensions/num.dart';
import 'package:breather_app/common/widgets/filled_app_button.dart';
import 'package:breather_app/features/schedular/domain/models/week_days/week_days.dart';
import 'package:breather_app/features/schedular/presentation/providers/schedular_provider/scheduled_time_provider.dart';
import 'package:breather_app/features/schedular/presentation/providers/schedular_provider/selected_weekdays_provider.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeekdayDialog extends ConsumerWidget {
  const WeekdayDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weekdays = ref.watch(selectedWeekdaysProvider);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF3761A5),
              Color(0xFF193A79),
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.hb,
            Column(
              children: WeekDay.values
                  .map(
                    (e) => Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 14.h,
                        horizontal: 30.w,
                      ),
                      child: InkWell(
                        onTap: () {
                          ref
                              .read(selectedWeekdaysProvider.notifier)
                              .updateList(e);

                          ref
                              .read(scheduledTimeInfoProvider.notifier)
                              .updateList(e.index);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              e.name,
                              style: TextStyle(
                                color: R.colors.white,
                              ),
                            ),
                            Icon(
                              (weekdays?.contains(e) ?? false)
                                  ? Icons.circle
                                  : Icons.circle_outlined,
                              color: R.colors.white,
                              size: 20.r,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            36.hb,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilledAppButton(
                  text: 'Cancel',
                  width: 111.w,
                  height: 42.h,
                  colors: const [
                    Color(0xFF464D58),
                    Color(0xFF464D58),
                  ],
                  onTap: () {},
                ),
                FilledAppButton(
                  text: 'OK',
                  width: 111.w,
                  height: 42.h,
                  colors: const [
                    Color(0xff2D579C),
                    Color(0xff163573),
                  ],
                  onTap: () {},
                ),
              ],
            ),
            31.hb,
          ],
        ),
      ),
    );
  }
}
