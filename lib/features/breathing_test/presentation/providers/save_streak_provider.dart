import 'package:breather_app/features/auth/presentation/providers/user_provider.dart';
import 'package:breather_app/features/breathing_test/domain/usecases/save_streak_usecase.dart';
import 'package:breather_app/utils/di/di.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final saveStreakProvider = FutureProvider.autoDispose<void>((ref) async {
  final saveStreakProvider = sl<SaveStreakUsecase>();
  final user = ref.read(userProvider);
  final input = SaveStreakUsecaseInput(
    userId: user?.id ?? '',
  );

  await saveStreakProvider(input);
});
