import 'package:breather_app/features/auth/presentation/providers/user_provider.dart';
import 'package:breather_app/features/breathing_test/domain/usecases/get_streak_usecase.dart';
import 'package:breather_app/utils/di/di.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streakProvider = FutureProvider.autoDispose<int>((ref) async {
  final getStreakUsecase = sl<GetStreakUsecase>();
  final user = ref.read(userProvider);
  final input = GetStreakUsecaseInput(userId: user?.id ?? '');

  final output = await getStreakUsecase(input);
  return output.streak;
});
