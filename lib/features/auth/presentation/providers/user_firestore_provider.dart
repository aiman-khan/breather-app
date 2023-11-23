import 'package:breather_app/features/auth/domain/models/user/user.dart';
import 'package:breather_app/features/auth/domain/usecases/get_user_from_firestore_usecase.dart';
import 'package:breather_app/features/auth/presentation/providers/user_provider.dart';
import 'package:breather_app/utils/di/di.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userFirestoreProvider =
    FutureProvider.autoDispose<UserModel?>((ref) async {
  final getUserUsecase = sl<GetUserFromFirestoreUsecase>();

  final user = ref.watch(userProvider);

  if (user == null) {
    return null;
  }

  final input = GetUserFromFirestoreUsecaseInput(id: user.id);

  final output = await getUserUsecase(input);
  return output.user;
});
