import 'package:breather_app/features/schedular/domain/usecases/save_schedule_usecase.dart';
import 'package:breather_app/features/schedular/presentation/providers/schedular_provider/scheduled_time_provider.dart';
import 'package:breather_app/utils/di/di.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final saveScheduleProvider = FutureProvider.autoDispose.family<void, String>(
  (ref, time) async {
    final saveScheduleUsecase = sl<SaveScheduleUsecase>();

    final scheduledTime = ref.read(scheduledTimeInfoProvider);
    final input = SaveScheduleUsecaseInput(
      key: scheduledTime.session!.name,
      scheduledTime: time,
    );

    await saveScheduleUsecase(input);
  },
);
