import 'package:breather_app/features/auth/domain/repository/auth_repository.dart';
import 'package:breather_app/infrastructure/usecase.dart';
import 'package:breather_app/infrastructure/usecase_input.dart';
import 'package:breather_app/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class GetScheduleUsecaseInput extends Input {
  final String key;

  GetScheduleUsecaseInput({required this.key});
}

class GetScheduleUsecaseOutput extends Output {
  final String scheduledTime;

  GetScheduleUsecaseOutput({required this.scheduledTime});
}

@lazySingleton
class GetScheduleUsecase
    extends Usecase<GetScheduleUsecaseInput, GetScheduleUsecaseOutput> {
  final AuthRepository _schedularRepository;

  GetScheduleUsecase({required AuthRepository schedularRepository})
      : _schedularRepository = schedularRepository;

  @override
  Future<GetScheduleUsecaseOutput> call(GetScheduleUsecaseInput input) async {
    return await _schedularRepository.getSchedule(input);
  }
}
