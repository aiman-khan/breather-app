import 'package:breather_app/features/schedular/domain/models/repeat_status/repeat_status.dart';
import 'package:breather_app/features/schedular/presentation/providers/schedular_provider/repeat_status_provider.dart';
import 'package:breather_app/features/schedular/presentation/providers/schedular_provider/scheduled_time_provider.dart';
import 'package:breather_app/features/schedular/presentation/views/set_timer/dialogs/timer_success_dialog.dart';
import 'package:breather_app/features/schedular/presentation/views/set_timer/dialogs/weekdays_dialog.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RepeatDialog extends ConsumerWidget {
  const RepeatDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          children: RepeatStatus.values
              .map(
                (e) => Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 14.h,
                    horizontal: 30.w,
                  ),
                  child: InkWell(
                    onTap: () async {
                      ref.read(repeatStatusProvider.notifier).state = e;
                      ref.read(scheduledTimeInfoProvider.notifier).repeat = e;

                      if (e == RepeatStatus.custom) {
                        if (context.mounted) {
                          GoRouter.of(context).pop();
                        }
                        if (context.mounted) {
                          showDialog<void>(
                            context: context,
                            builder: (context) {
                              return const WeekdayDialog();
                            },
                          );
                        }
                      } else {
                        GoRouter.of(context).pop();

                        showDialog(
                          context: context,
                          builder: (context) {
                            return const TimerSuccessDialog();
                          },
                        );
                      }
                    },
                    child: Text(
                      e.name,
                      style: TextStyle(
                        color: R.colors.white,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
