import 'package:breather_app/infrastructure/usecase.dart';
import 'package:breather_app/infrastructure/usecase_input.dart';
import 'package:breather_app/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

import '../repository/auth_repository.dart';

class SaveInterestUsecaseInput extends Input {
  final List<String>? interests;

  SaveInterestUsecaseInput({required this.interests});
}

class SaveInterestUsecaseOutput extends Output {}

@lazySingleton
class SaveInterestUsecase
    extends Usecase<SaveInterestUsecaseInput, SaveInterestUsecaseOutput> {
  final AuthRepository _signUpRepository;

  SaveInterestUsecase({required AuthRepository signUpRepository})
      : _signUpRepository = signUpRepository;

  @override
  Future<SaveInterestUsecaseOutput> call(SaveInterestUsecaseInput input) async {
    return await _signUpRepository.saveInterest(input);
  }
}
