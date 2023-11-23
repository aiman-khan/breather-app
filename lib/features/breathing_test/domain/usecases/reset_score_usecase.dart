import 'package:breather_app/features/breathing_test/domain/repository/repository.dart';
import 'package:breather_app/infrastructure/usecase.dart';
import 'package:breather_app/infrastructure/usecase_input.dart';
import 'package:breather_app/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class ResetScoreUsecaseInput extends Input {
  ResetScoreUsecaseInput();
}

class ResetScoreUsecaseOutput extends Output {
  final List<String>? interests;

  ResetScoreUsecaseOutput({required this.interests});
}

@lazySingleton
class ResetScoreUsecase
    extends Usecase<ResetScoreUsecaseInput, ResetScoreUsecaseOutput> {
  final BreatherRepository _breatherRepository;

  ResetScoreUsecase({required BreatherRepository breatherRepository})
      : _breatherRepository = breatherRepository;

  @override
  Future<ResetScoreUsecaseOutput> call(ResetScoreUsecaseInput input) async {
    return await _breatherRepository.resetScore(input);
  }
}
