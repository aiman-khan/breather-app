import 'package:breather_app/infrastructure/usecase.dart';
import 'package:breather_app/infrastructure/usecase_input.dart';
import 'package:breather_app/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

import '../repository/auth_repository.dart';

class RemoveUserUsecaseInput extends Input {}

class RemoveUserUsecaseOutput extends Output {}

@lazySingleton
class RemoveUserUsecase
    extends Usecase<RemoveUserUsecaseInput, RemoveUserUsecaseOutput> {
  final AuthRepository _signUpRepository;

  RemoveUserUsecase({required AuthRepository signUpRepository})
      : _signUpRepository = signUpRepository;

  @override
  Future<RemoveUserUsecaseOutput> call(RemoveUserUsecaseInput input) async {
    return await _signUpRepository.removeUser(input);
  }
}
