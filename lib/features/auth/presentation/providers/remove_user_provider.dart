import 'package:breather_app/features/auth/domain/usecases/remove_user_usecase.dart';
import 'package:breather_app/utils/di/di.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final removeUserProvider = FutureProvider.autoDispose<void>((ref) async {
  final removeUserUsecase = sl<RemoveUserUsecase>();

  final input = RemoveUserUsecaseInput();

  await removeUserUsecase(input);
});
