import 'package:breather_app/features/auth/domain/models/user/user.dart';
import 'package:breather_app/infrastructure/usecase.dart';
import 'package:breather_app/infrastructure/usecase_input.dart';
import 'package:breather_app/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

import '../repository/auth_repository.dart';

class GetUserFromFirestoreUsecaseInput extends Input {
  GetUserFromFirestoreUsecaseInput({required this.id});

  final String id;
}

class GetUserFromFirestoreUsecaseOutput extends Output {
  final UserModel? user;

  GetUserFromFirestoreUsecaseOutput({required this.user});
}

@lazySingleton
class GetUserFromFirestoreUsecase extends Usecase<
    GetUserFromFirestoreUsecaseInput, GetUserFromFirestoreUsecaseOutput> {
  final AuthRepository _signUpRepository;

  GetUserFromFirestoreUsecase({required AuthRepository signUpRepository})
      : _signUpRepository = signUpRepository;

  @override
  Future<GetUserFromFirestoreUsecaseOutput> call(
      GetUserFromFirestoreUsecaseInput input) async {
    return await _signUpRepository.getUserFromFirestore(input);
  }
}
