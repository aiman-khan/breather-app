import 'package:breather_app/infrastructure/usecase.dart';
import 'package:breather_app/infrastructure/usecase_input.dart';
import 'package:breather_app/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

import '../repository/auth_repository.dart';

class IsFreshInstallUsecaseInput extends Input {}

class IsFreshInstallUsecaseOutput extends Output {
  IsFreshInstallUsecaseOutput({required this.isFresh});

  final bool isFresh;
}

@lazySingleton
class IsFreshInstallUsecase
    extends Usecase<IsFreshInstallUsecaseInput, IsFreshInstallUsecaseOutput> {
  final AuthRepository _signUpRepository;

  IsFreshInstallUsecase({required AuthRepository signUpRepository})
      : _signUpRepository = signUpRepository;

  @override
  Future<IsFreshInstallUsecaseOutput> call(
      IsFreshInstallUsecaseInput input) async {
    return await _signUpRepository.isFreshInstall(input);
  }
}
