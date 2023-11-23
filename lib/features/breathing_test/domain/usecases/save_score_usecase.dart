import 'package:breather_app/features/breathing_test/domain/repository/repository.dart';
import 'package:breather_app/infrastructure/usecase.dart';
import 'package:breather_app/infrastructure/usecase_input.dart';
import 'package:breather_app/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class SaveScoreUsecaseInput extends Input {
  SaveScoreUsecaseInput({
    required this.score,
    required this.userId,
    required this.completedExercises,
  });

  final int score;
  final String userId;
  final int completedExercises;
}

class SaveScoreUsecaseOutput extends Output {}

@lazySingleton
class SaveScoreUsecase
    extends Usecase<SaveScoreUsecaseInput, SaveScoreUsecaseOutput> {
  final BreatherRepository _breatherRepository;

  SaveScoreUsecase({required BreatherRepository breatherRepository})
      : _breatherRepository = breatherRepository;

  @override
  Future<SaveScoreUsecaseOutput> call(SaveScoreUsecaseInput input) async {
    return await _breatherRepository.saveScore(input);
  }
}
