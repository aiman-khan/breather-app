import 'package:breather_app/infrastructure/usecase.dart';
import 'package:breather_app/infrastructure/usecase_input.dart';
import 'package:breather_app/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

import '../repository/auth_repository.dart';

class SetFreshInstallUsecaseInput extends Input {}

class SetFreshInstallUsecaseOutput extends Output {}

@lazySingleton
class SetFreshInstallUsecase
    extends Usecase<SetFreshInstallUsecaseInput, SetFreshInstallUsecaseOutput> {
  final AuthRepository _signUpRepository;

  SetFreshInstallUsecase({required AuthRepository signUpRepository})
      : _signUpRepository = signUpRepository;

  @override
  Future<SetFreshInstallUsecaseOutput> call(
      SetFreshInstallUsecaseInput input) async {
    return await _signUpRepository.setFreshInstall(input);
  }
}
