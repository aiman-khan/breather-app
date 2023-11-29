import 'package:breather_app/features/auth/domain/repository/auth_repository.dart';
import 'package:breather_app/infrastructure/usecase.dart';
import 'package:breather_app/infrastructure/usecase_input.dart';
import 'package:breather_app/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class SaveScheduleUsecaseInput extends Input {
  final String key;
  final String scheduledTime;

  SaveScheduleUsecaseInput({
    required this.key,
    required this.scheduledTime,
  });
}

class SaveScheduleUsecaseOutput extends Output {}

@lazySingleton
class SaveScheduleUsecase
    extends Usecase<SaveScheduleUsecaseInput, SaveScheduleUsecaseOutput> {
  final AuthRepository _schedularRepository;

  SaveScheduleUsecase({required AuthRepository schedularRepository})
      : _schedularRepository = schedularRepository;

  @override
  Future<SaveScheduleUsecaseOutput> call(SaveScheduleUsecaseInput input) async {
    return await _schedularRepository.saveSchedule(input);
  }
}
