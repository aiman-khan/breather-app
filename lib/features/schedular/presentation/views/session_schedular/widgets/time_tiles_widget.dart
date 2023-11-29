import 'package:breather_app/common/extensions/num.dart';
import 'package:breather_app/features/schedular/domain/models/session/session.dart';
import 'package:breather_app/features/schedular/presentation/providers/persistance_providers/get_schedule_provider.dart';
import 'package:breather_app/features/schedular/presentation/providers/schedular_provider/scheduled_time_provider.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:breather_app/utils/router/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class TimeTilesWidget extends StatelessWidget {
  const TimeTilesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: Session.values
          .map(
            (e) => SlotWidget(
              session: e,
            ),
          )
          .toList(),
    );
  }
}

class SlotWidget extends ConsumerWidget {
  const SlotWidget({
    super.key,
    required this.session,
  });

  final Session session;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getScheduleAsync = ref.watch(getScheduleProvider(session.name));
    String formattedTime = '';

    if (!getScheduleAsync.hasValue) {
      return const SizedBox.shrink();
    }

    final schedule = getScheduleAsync.value;

    if (schedule == null || schedule.isEmpty) {
      formattedTime = '0:00';
    } else {
      formattedTime = DateFormat('h:mm').format(DateTime.parse(schedule));
    }
    return Padding(
      padding: EdgeInsets.only(bottom: 26.h),
      child: Consumer(builder: (context, ref, _) {
        return InkWell(
          onTap: () {
            ref.read(scheduledTimeInfoProvider.notifier).session = session;
            GoRouter.of(context).push(RoutePaths.setTimer);
          },
          child: Container(
            height: 63.h,
            width: 279.w,
            padding: EdgeInsets.only(
              left: 34.w,
              right: 8.w,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: session.color,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 80.w,
                  child: Text(
                    session.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: session.textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  formattedTime,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: session.textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                4.wb,
                Icon(
                  Icons.chevron_right,
                  size: 24.r,
                  color: session.textColor,
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
