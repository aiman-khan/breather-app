import 'package:breather_app/features/breathing_test/domain/repository/repository.dart';
import 'package:breather_app/infrastructure/usecase.dart';
import 'package:breather_app/infrastructure/usecase_input.dart';
import 'package:breather_app/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class AwardBadgeUsecaseInput extends Input {
  AwardBadgeUsecaseInput({
    required this.userId,
    required this.badges,
  });

  final String userId;
  final List<String> badges;
}

class AwardBadgeUsecaseOutput extends Output {}

@lazySingleton
class AwardBadgeUsecase
    extends Usecase<AwardBadgeUsecaseInput, AwardBadgeUsecaseOutput> {
  final BreatherRepository _breatherRepository;

  AwardBadgeUsecase({required BreatherRepository breatherRepository})
      : _breatherRepository = breatherRepository;

  @override
  Future<AwardBadgeUsecaseOutput> call(AwardBadgeUsecaseInput input) async {
    return await _breatherRepository.awardBadge(input);
  }
}
