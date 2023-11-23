import 'package:breather_app/features/breathing_test/domain/data/source/firebase/firebase_data_source.dart';
import 'package:breather_app/features/breathing_test/domain/repository/repository.dart';
import 'package:breather_app/features/breathing_test/domain/usecases/award_badge_usecase.dart';
import 'package:breather_app/features/breathing_test/domain/usecases/get_score_usecase.dart';
import 'package:breather_app/features/breathing_test/domain/usecases/get_streak_usecase.dart';
import 'package:breather_app/features/breathing_test/domain/usecases/reset_score_usecase.dart';
import 'package:breather_app/features/breathing_test/domain/usecases/save_score_usecase.dart';
import 'package:breather_app/features/breathing_test/domain/usecases/save_streak_usecase.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BreatherRepository)
class BreatherRepositoryImpl implements BreatherRepository {
  BreatherRepositoryImpl({
    required this.breatherFirebaseDataSource,
  });

  final BreatherFirebaseDataSource breatherFirebaseDataSource;

  @override
  Future<GetScoreUsecaseOutput> getScore(GetScoreUsecaseInput input) {
    return breatherFirebaseDataSource.getScore(input);
  }

  @override
  Future<GetStreakUsecaseOutput> getStreak(GetStreakUsecaseInput input) {
    return breatherFirebaseDataSource.getStreak(input);
  }

  @override
  Future<ResetScoreUsecaseOutput> resetScore(ResetScoreUsecaseInput input) {
    return breatherFirebaseDataSource.resetScore(input);
  }

  @override
  Future<SaveScoreUsecaseOutput> saveScore(SaveScoreUsecaseInput input) {
    return breatherFirebaseDataSource.saveScore(input);
  }

  @override
  Future<SaveStreakUsecaseOutput> saveStreak(SaveStreakUsecaseInput input) {
    return breatherFirebaseDataSource.saveStreak(input);
  }

  @override
  Future<AwardBadgeUsecaseOutput> awardBadge(AwardBadgeUsecaseInput input) {
    return breatherFirebaseDataSource.awardBadge(input);
  }
}
