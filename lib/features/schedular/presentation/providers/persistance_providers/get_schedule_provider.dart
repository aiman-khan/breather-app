import 'package:breather_app/features/schedular/domain/usecases/get_schedule_usecase.dart';
import 'package:breather_app/utils/di/di.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getScheduleProvider = FutureProvider.autoDispose.family<String, String>(
  (ref, key) async {
    final getScheduleUsecase = sl<GetScheduleUsecase>();

    final input = GetScheduleUsecaseInput(key: key);

    final output = await getScheduleUsecase(input);
    return output.scheduledTime;
  },
);
