import 'package:breather_app/features/auth/domain/repository/auth_repository.dart';
import 'package:breather_app/infrastructure/usecase.dart';
import 'package:breather_app/infrastructure/usecase_input.dart';
import 'package:breather_app/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class RemoveScheduleUsecaseInput extends Input {
  final String key;

  RemoveScheduleUsecaseInput({required this.key});
}

class RemoveScheduleUsecaseOutput extends Output {}

@lazySingleton
class RemoveScheduleUsecase
    extends Usecase<RemoveScheduleUsecaseInput, RemoveScheduleUsecaseOutput> {
  final AuthRepository _schedularRepository;

  RemoveScheduleUsecase({required AuthRepository schedularRepository})
      : _schedularRepository = schedularRepository;

  @override
  Future<RemoveScheduleUsecaseOutput> call(
      RemoveScheduleUsecaseInput input) async {
    return await _schedularRepository.removeSchedule(input);
  }
}
