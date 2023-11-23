import 'package:breather_app/features/breathing_test/domain/repository/repository.dart';
import 'package:breather_app/infrastructure/usecase.dart';
import 'package:breather_app/infrastructure/usecase_input.dart';
import 'package:breather_app/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class SaveStreakUsecaseInput extends Input {
  SaveStreakUsecaseInput({
    required this.userId,
  });

  final String userId;
}

class SaveStreakUsecaseOutput extends Output {}

@lazySingleton
class SaveStreakUsecase
    extends Usecase<SaveStreakUsecaseInput, SaveStreakUsecaseOutput> {
  final BreatherRepository _breatherRepository;

  SaveStreakUsecase({required BreatherRepository breatherRepository})
      : _breatherRepository = breatherRepository;

  @override
  Future<SaveStreakUsecaseOutput> call(SaveStreakUsecaseInput input) async {
    return await _breatherRepository.saveStreak(input);
  }
}
