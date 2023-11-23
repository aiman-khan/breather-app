import 'package:breather_app/features/auth/domain/models/user/user.dart';
import 'package:breather_app/infrastructure/usecase.dart';
import 'package:breather_app/infrastructure/usecase_input.dart';
import 'package:breather_app/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

import '../repository/auth_repository.dart';

class SaveUserUsecaseInput extends Input {
  final UserModel user;

  SaveUserUsecaseInput({required this.user});
}

class SaveUserUsecaseOutput extends Output {}

@lazySingleton
class SaveUserUsecase
    extends Usecase<SaveUserUsecaseInput, SaveUserUsecaseOutput> {
  final AuthRepository _signUpRepository;

  SaveUserUsecase({required AuthRepository signUpRepository})
      : _signUpRepository = signUpRepository;

  @override
  Future<SaveUserUsecaseOutput> call(SaveUserUsecaseInput input) async {
    return await _signUpRepository.saveUser(input);
  }
}
