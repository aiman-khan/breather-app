import 'package:breather_app/features/auth/presentation/providers/user_provider.dart';
import 'package:breather_app/features/breathing_test/domain/usecases/save_score_usecase.dart';
import 'package:breather_app/utils/di/di.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final saveScoreProvider =
    FutureProvider.autoDispose.family<void, int>((ref, score) async {
  final saveScoreUsecase = sl<SaveScoreUsecase>();
  final user = ref.watch(userProvider);

  final input = SaveScoreUsecaseInput(
    userId: user?.id ?? '',
    score: score,
    completedExercises: 1,
  );

  await saveScoreUsecase(input);
});
