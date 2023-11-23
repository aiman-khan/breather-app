import 'package:breather_app/infrastructure/usecase.dart';
import 'package:breather_app/infrastructure/usecase_input.dart';
import 'package:breather_app/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

import '../repository/auth_repository.dart';

class GetInterestsUsecaseInput extends Input {
  GetInterestsUsecaseInput();
}

class GetInterestsUsecaseOutput extends Output {
  final List<String>? interests;

  GetInterestsUsecaseOutput({required this.interests});
}

@lazySingleton
class GetInterestsUsecase
    extends Usecase<GetInterestsUsecaseInput, GetInterestsUsecaseOutput> {
  final AuthRepository _signUpRepository;

  GetInterestsUsecase({required AuthRepository signUpRepository})
      : _signUpRepository = signUpRepository;

  @override
  Future<GetInterestsUsecaseOutput> call(GetInterestsUsecaseInput input) async {
    return await _signUpRepository.getInterests(input);
  }
}
