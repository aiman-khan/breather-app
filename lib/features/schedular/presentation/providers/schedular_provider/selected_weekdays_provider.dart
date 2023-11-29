import 'package:breather_app/features/schedular/domain/models/week_days/week_days.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class _SelectedWeekdaysNotifier extends StateNotifier<List<WeekDay>?> {
  _SelectedWeekdaysNotifier() : super(null);

  void updateList(WeekDay weekday) {
    if (state?.contains(weekday) ?? false) {
      state = state?.where((day) => day != weekday).toList();
    } else {
      state = [...state ?? [], weekday];
    }
  }

  List<WeekDay>? get weekdays => state;
}

final selectedWeekdaysProvider =
    StateNotifierProvider<_SelectedWeekdaysNotifier, List<WeekDay>?>(
  (ref) => _SelectedWeekdaysNotifier(),
);
