import 'package:breather_app/features/breathing_test/domain/usecases/award_badge_usecase.dart';
import 'package:breather_app/features/breathing_test/domain/usecases/get_score_usecase.dart';
import 'package:breather_app/features/breathing_test/domain/usecases/get_streak_usecase.dart';
import 'package:breather_app/features/breathing_test/domain/usecases/reset_score_usecase.dart';
import 'package:breather_app/features/breathing_test/domain/usecases/save_score_usecase.dart';
import 'package:breather_app/features/breathing_test/domain/usecases/save_streak_usecase.dart';

abstract class BreatherFirebaseDataSource {
  Future<SaveStreakUsecaseOutput> saveStreak(SaveStreakUsecaseInput input);

  Future<GetStreakUsecaseOutput> getStreak(GetStreakUsecaseInput input);

  Future<GetScoreUsecaseOutput> getScore(GetScoreUsecaseInput input);

  Future<SaveScoreUsecaseOutput> saveScore(SaveScoreUsecaseInput input);

  Future<ResetScoreUsecaseOutput> resetScore(ResetScoreUsecaseInput input);

  Future<AwardBadgeUsecaseOutput> awardBadge(AwardBadgeUsecaseInput input);
}
