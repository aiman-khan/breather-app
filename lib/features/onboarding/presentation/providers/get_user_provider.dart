import 'package:breather_app/features/auth/domain/models/user/user.dart';
import 'package:breather_app/features/auth/domain/usecases/get_user_usecase.dart';
import 'package:breather_app/utils/di/di.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getUserProvider = FutureProvider<UserModel?>((ref) async {
  final getUserUsecase = sl<GetUserUsecase>();
  final input = GetUserUsecaseInput();
  final output = await getUserUsecase(input);

  return output.user;
});
