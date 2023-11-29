import 'package:breather_app/features/schedular/domain/models/repeat_status/repeat_status.dart';
import 'package:breather_app/features/schedular/domain/models/scheduled_time/scheduled_time.dart';
import 'package:breather_app/features/schedular/domain/models/session/session.dart';
import 'package:breather_app/utils/export.dart';

class _ScheduledTimeNotifier extends StateNotifier<ScheduledTimeModel> {
  _ScheduledTimeNotifier() : super(ScheduledTimeModel());

  void updateList(int weekday) {
    if (state.weekDays?.contains(weekday) ?? false) {
      state = state.copyWith(
          weekDays: state.weekDays?.where((day) => day != weekday).toList());
    } else {
      state = state.copyWith(weekDays: [...state.weekDays ?? [], weekday]);
    }
  }

  List<int>? get weekdays => state.weekDays;

  set time(DateTime? time) => state = state.copyWith(time: time);
  DateTime? get time => state.time;

  set repeat(RepeatStatus? repeat) => state = state.copyWith(repeat: repeat);
  RepeatStatus? get repeat => state.repeat;

  set session(Session? session) => state = state.copyWith(session: session);
  Session? get session => state.session;
}

final scheduledTimeInfoProvider =
    StateNotifierProvider<_ScheduledTimeNotifier, ScheduledTimeModel>(
  (ref) => _ScheduledTimeNotifier(),
);
