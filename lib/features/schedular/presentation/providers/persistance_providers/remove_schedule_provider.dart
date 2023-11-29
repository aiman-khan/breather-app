import 'package:breather_app/features/schedular/domain/usecases/remove_schedule_usecase.dart';
import 'package:breather_app/utils/di/di.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final removeScheduleProvider = FutureProvider.autoDispose.family<void, String>(
  (ref, key) async {
    final removeScheduleUsecase = sl<RemoveScheduleUsecase>();

    final input = RemoveScheduleUsecaseInput(key: key);

    await removeScheduleUsecase(input);
  },
);
