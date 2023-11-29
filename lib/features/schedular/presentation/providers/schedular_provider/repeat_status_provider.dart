import 'package:breather_app/features/schedular/domain/models/repeat_status/repeat_status.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final repeatStatusProvider =
    StateProvider.autoDispose<RepeatStatus?>((ref) => null);
