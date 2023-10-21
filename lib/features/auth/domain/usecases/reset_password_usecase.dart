import 'package:breather_app/infrastructure/usecase.dart';
import 'package:breather_app/infrastructure/usecase_input.dart';
import 'package:breather_app/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

import '../repository/auth_repository.dart';

class ResetPasswordUsecaseInput extends Input {
  final String email;

  ResetPasswordUsecaseInput({
    required this.email,
  });
}

class ResetPasswordUsecaseOutput extends Output {
  final bool isSuccess;

  ResetPasswordUsecaseOutput({required this.isSuccess});
}

@lazySingleton
class ResetPasswordUsecase
    extends Usecase<ResetPasswordUsecaseInput, ResetPasswordUsecaseOutput> {
  final AuthRepository _signUpRepository;

  ResetPasswordUsecase({required AuthRepository signUpRepository})
      : _signUpRepository = signUpRepository;

  @override
  Future<ResetPasswordUsecaseOutput> call(
      ResetPasswordUsecaseInput input) async {
    return await _signUpRepository.resetPassword(input);
  }
}
