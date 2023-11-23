import 'package:breather_app/features/auth/domain/models/score/score.dart';
import 'package:breather_app/features/breathing_test/domain/repository/repository.dart';
import 'package:breather_app/infrastructure/usecase.dart';
import 'package:breather_app/infrastructure/usecase_input.dart';
import 'package:breather_app/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class GetScoreUsecaseInput extends Input {
  GetScoreUsecaseInput({
    required this.userId,
  });

  final String userId;
}

class GetScoreUsecaseOutput extends Output {
  final Score? score;

  GetScoreUsecaseOutput({required this.score});
}

@lazySingleton
class GetScoreUsecase
    extends Usecase<GetScoreUsecaseInput, GetScoreUsecaseOutput> {
  final BreatherRepository _breatherRepository;

  GetScoreUsecase({required BreatherRepository breatherRepository})
      : _breatherRepository = breatherRepository;

  @override
  Future<GetScoreUsecaseOutput> call(GetScoreUsecaseInput input) async {
    return await _breatherRepository.getScore(input);
  }
}
