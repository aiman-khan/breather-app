import 'package:breather_app/features/auth/domain/models/score/score.dart';
import 'package:breather_app/features/breathing_test/domain/usecases/get_score_usecase.dart';
import 'package:breather_app/features/onboarding/presentation/providers/get_user_provider.dart';
import 'package:breather_app/utils/di/di.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final scoreProvider = FutureProvider.autoDispose<Score?>((ref) async {
  final getScoreUsecase = sl<GetScoreUsecase>();
  final user = await ref.read(getUserProvider.future);
  final input = GetScoreUsecaseInput(userId: user?.id ?? '');

  final output = await getScoreUsecase(input);
  return output.score;
});
