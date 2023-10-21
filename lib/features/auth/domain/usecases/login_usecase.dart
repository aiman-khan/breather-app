import 'package:breather_app/features/auth/domain/models/user/user.dart';
import 'package:breather_app/infrastructure/usecase.dart';
import 'package:breather_app/infrastructure/usecase_input.dart';
import 'package:breather_app/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

import '../repository/auth_repository.dart';

class LoginUsecaseInput extends Input {
  final String password;
  final String email;

  LoginUsecaseInput({
    required this.password,
    required this.email,
  });
}

class LoginUsecaseOutput extends Output {
  final UserModel user;

  LoginUsecaseOutput({required this.user});
}

@lazySingleton
class LoginUsecase extends Usecase<LoginUsecaseInput, LoginUsecaseOutput> {
  final AuthRepository _signUpRepository;

  LoginUsecase({required AuthRepository signUpRepository})
      : _signUpRepository = signUpRepository;

  @override
  Future<LoginUsecaseOutput> call(LoginUsecaseInput input) async {
    return await _signUpRepository.login(input);
  }
}
