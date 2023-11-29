import 'package:breather_app/features/schedular/domain/models/repeat_status/repeat_status.dart';
import 'package:breather_app/features/schedular/domain/models/session/session.dart';
import 'package:breather_app/features/schedular/domain/models/week_days/week_days.dart';

class ScheduledTimeModel {
  final DateTime? time;
  final RepeatStatus? repeat;
  final List<int>? weekDays;
  final Session? session;

  ScheduledTimeModel({
    this.time,
    this.repeat,
    this.weekDays,
    this.session,
  });

  ScheduledTimeModel copyWith({
    RepeatStatus? repeat,
    DateTime? time,
    List<int>? weekDays,
    Session? session,
  }) {
    return ScheduledTimeModel(
      repeat: repeat ?? this.repeat,
      time: time ?? this.time,
      weekDays: weekDays ?? this.weekDays,
      session: session ?? this.session,
    );
  }
}
