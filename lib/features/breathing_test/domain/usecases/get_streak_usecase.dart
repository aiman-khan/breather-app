import 'package:breather_app/features/breathing_test/domain/repository/repository.dart';
import 'package:breather_app/infrastructure/usecase.dart';
import 'package:breather_app/infrastructure/usecase_input.dart';
import 'package:breather_app/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class GetStreakUsecaseInput extends Input {
  GetStreakUsecaseInput({required this.userId});

  final String userId;
}

class GetStreakUsecaseOutput extends Output {
  final int streak;

  GetStreakUsecaseOutput({required this.streak});
}

@lazySingleton
class GetStreakUsecase
    extends Usecase<GetStreakUsecaseInput, GetStreakUsecaseOutput> {
  final BreatherRepository _breatherRepository;

  GetStreakUsecase({required BreatherRepository breatherRepository})
      : _breatherRepository = breatherRepository;

  @override
  Future<GetStreakUsecaseOutput> call(GetStreakUsecaseInput input) async {
    return await _breatherRepository.getStreak(input);
  }
}
