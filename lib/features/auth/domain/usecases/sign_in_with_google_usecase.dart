import 'package:breather_app/features/auth/domain/models/user/user.dart';
import 'package:breather_app/infrastructure/usecase.dart';
import 'package:breather_app/infrastructure/usecase_input.dart';
import 'package:breather_app/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

import '../repository/auth_repository.dart';

class SignInWithGoogleUsecaseInput extends Input {
  SignInWithGoogleUsecaseInput();
}

class SignInWithGoogleUsecaseOutput extends Output {
  final UserModel user;

  SignInWithGoogleUsecaseOutput({required this.user});
}

@lazySingleton
class SignInWithGoogleUsecase extends Usecase<SignInWithGoogleUsecaseInput,
    SignInWithGoogleUsecaseOutput> {
  final AuthRepository _signUpRepository;

  SignInWithGoogleUsecase({required AuthRepository signUpRepository})
      : _signUpRepository = signUpRepository;

  @override
  Future<SignInWithGoogleUsecaseOutput> call(
      SignInWithGoogleUsecaseInput input) async {
    return await _signUpRepository.signInWithGoogle(input);
  }
}
