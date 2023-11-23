import 'package:breather_app/features/auth/domain/models/user/user.dart';
import 'package:breather_app/infrastructure/usecase.dart';
import 'package:breather_app/infrastructure/usecase_input.dart';
import 'package:breather_app/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

import '../repository/auth_repository.dart';

class GetUserUsecaseInput extends Input {
  GetUserUsecaseInput();
}

class GetUserUsecaseOutput extends Output {
  final UserModel? user;

  GetUserUsecaseOutput({required this.user});
}

@lazySingleton
class GetUserUsecase
    extends Usecase<GetUserUsecaseInput, GetUserUsecaseOutput> {
  final AuthRepository _signUpRepository;

  GetUserUsecase({required AuthRepository signUpRepository})
      : _signUpRepository = signUpRepository;

  @override
  Future<GetUserUsecaseOutput> call(GetUserUsecaseInput input) async {
    return await _signUpRepository.getUser(input);
  }
}
