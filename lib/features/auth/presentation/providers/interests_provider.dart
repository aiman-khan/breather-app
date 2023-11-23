import 'package:flutter_riverpod/flutter_riverpod.dart';

class _InterestsNotifier extends StateNotifier<List<String>?> {
  _InterestsNotifier() : super(null);

  void setInterests(List<String>? interests) {
    state = interests;
  }

  List<String>? get interests => state;
}

final interestsProvider =
    StateNotifierProvider<_InterestsNotifier, List<String>?>(
  (ref) => _InterestsNotifier(),
);
