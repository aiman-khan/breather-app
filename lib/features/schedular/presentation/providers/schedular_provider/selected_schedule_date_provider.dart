import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedScheduleDateProvider =
    StateProvider.autoDispose<DateTime?>((ref) => null);
