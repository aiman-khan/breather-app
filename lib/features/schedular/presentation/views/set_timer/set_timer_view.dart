import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:breather_app/common/widgets/filled_app_button.dart';
import 'package:breather_app/features/schedular/domain/models/repeat_status/repeat_status.dart';
import 'package:breather_app/features/schedular/presentation/providers/persistance_providers/save_schedule_provider.dart';
import 'package:breather_app/features/schedular/presentation/providers/schedular_provider/repeat_status_provider.dart';
import 'package:breather_app/features/schedular/presentation/providers/schedular_provider/scheduled_time_provider.dart';
import 'package:breather_app/features/schedular/presentation/providers/schedular_provider/selected_schedule_date_provider.dart';
import 'package:breather_app/features/schedular/presentation/views/set_timer/tiles/repeat_tile.dart';
import 'package:breather_app/features/schedular/presentation/views/set_timer/tiles/ringtone_tile.dart';
import 'package:breather_app/features/schedular/presentation/views/set_timer/tiles/vibrate_tile.dart';
import 'package:breather_app/utils/export.dart';

class SetTimerView extends ConsumerStatefulWidget {
  const SetTimerView({super.key});

  @override
  ConsumerState<SetTimerView> createState() => _SetTimerViewState();
}

class _SetTimerViewState extends ConsumerState<SetTimerView> {
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  void _apply() {
    AwesomeNotifications().cancelSchedule(1);
    final scheduledTime = ref.read(scheduledTimeInfoProvider);
    final date = ref.read(selectedScheduleDateProvider);

    final time = scheduledTime.time!;
    final repeat = scheduledTime.repeat;
    var weekdays = scheduledTime.weekDays;

    final repeatDays = ref.read(repeatStatusProvider);

    if (repeat == RepeatStatus.once || repeat == RepeatStatus.daily) {
      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 1,
          channelKey: 'basic_channel',
          title: 'Reminder',
          body: 'Come back to complete your daily exercise.',
        ),
        schedule: NotificationCalendar(
          hour: time.hour,
          minute: time.minute,
          second: time.second,
          day: time.day,
          month: time.month,
          year: time.year,
          allowWhileIdle: true,
          repeats: repeat == RepeatStatus.once ? false : true,
        ),
      );
    } else {
      if (repeatDays == RepeatStatus.satSun) {
        weekdays = [6, 7];
      }

      if (repeatDays == RepeatStatus.monToFri) {
        weekdays = [1, 2, 3, 4, 5];
      }

      for (var day in weekdays ?? []) {
        AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: 1,
            channelKey: 'basic_channel',
            title: 'Reminder',
            body: 'Come back to complete your daily exercise.',
          ),
          schedule: NotificationCalendar(
            hour: time.hour,
            minute: time.minute,
            second: time.second,
            day: date!.day,
            month: date.month,
            year: date.year,
            weekday: day,
            allowWhileIdle: true,
            repeats: true,
          ),
        );
      }
    }

    _save();
  }

  Future<void> _save() async {
    final scheduledTime = ref.read(scheduledTimeInfoProvider);

    try {
      await ref
          .read(saveScheduleProvider(scheduledTime.time!.toString()).future);
    } catch (e) {
      log('$e');
    }
  }

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
                  Text(
                    'Set Timer',
                    style: TextStyle(
                      fontSize: 22.sp,
                      color: R.colors.blue19214C,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  1.hb,
                  Text(
                    'Tap to adjust the timer',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: R.colors.grey6F6F6F,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 339.w,
                    height: 150.h,
                    child: BottomPicker.time(
                      displayCloseIcon: false,
                      displaySubmitButton: false,
                      backgroundColor: Colors.transparent,
                      title: '',
                      pickerTextStyle: TextStyle(
                        color: R.colors.black,
                        fontSize: 16.sp,
                      ),
                      onChange: (v) {
                        ref.read(scheduledTimeInfoProvider.notifier).time = v;
                      },
                      use24hFormat: false,
                      initialTime: Time(
                        minutes: 59,
                      ),
                      maxTime: Time(
                        hours: 23,
                      ),
                    ),
                  ),
                  54.hb,
                  const RingToneTileWidget(),
                  36.hb,
                  const RepeatTileWidget(),
                  36.hb,
                  const VibrateTile(),
                  44.hb,
                  Text(
                    'Vibrate when alarm sounds',
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: R.colors.grey474747,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.03.w,
                    ),
                  ),
                  const Spacer(),
                  FilledAppButton(
                    text: 'Apply',
                    height: 42.h,
                    width: 111.w,
                    onTap: _apply,
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
