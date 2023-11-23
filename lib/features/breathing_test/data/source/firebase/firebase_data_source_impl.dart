import 'dart:developer';

import 'package:breather_app/features/auth/domain/models/score/score.dart';
import 'package:breather_app/features/breathing_test/domain/data/source/firebase/firebase_data_source.dart';
import 'package:breather_app/features/breathing_test/domain/usecases/award_badge_usecase.dart';
import 'package:breather_app/features/breathing_test/domain/usecases/get_score_usecase.dart';
import 'package:breather_app/features/breathing_test/domain/usecases/get_streak_usecase.dart';
import 'package:breather_app/features/breathing_test/domain/usecases/reset_score_usecase.dart';
import 'package:breather_app/features/breathing_test/domain/usecases/save_score_usecase.dart';
import 'package:breather_app/features/breathing_test/domain/usecases/save_streak_usecase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

const users = 'users';
const dailyData = 'dailyData';
const score = 'score';

@LazySingleton(as: BreatherFirebaseDataSource)
class BreatherFirebaseDataSourceImpl implements BreatherFirebaseDataSource {
  @override
  Future<GetScoreUsecaseOutput> getScore(GetScoreUsecaseInput input) async {
    try {
      CollectionReference scoreCollection =
          FirebaseFirestore.instance.collection(score);

      DocumentSnapshot doc = await scoreCollection.doc(input.userId).get();

      if (doc.exists) {
        final score = Score.fromFirestore(doc);
        return GetScoreUsecaseOutput(score: score);
      }
    } catch (e) {
      debugPrint('Error getting user score: $e');
    }

    return GetScoreUsecaseOutput(score: null);
  }

  @override
  Future<GetStreakUsecaseOutput> getStreak(GetStreakUsecaseInput input) async {
    int streakCount = 0;

    try {
      final collection = FirebaseFirestore.instance.collection(users);
      var docSnapshot = await collection.doc(input.userId).get();
      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data()!;

        streakCount = data['streak'];
      }
    } catch (e) {
      debugPrint('Error getting streak: $e');
    }

    return GetStreakUsecaseOutput(streak: streakCount);
  }

  @override
  Future<ResetScoreUsecaseOutput> resetScore(ResetScoreUsecaseInput input) {
    throw UnimplementedError();
  }

  @override
  Future<SaveScoreUsecaseOutput> saveScore(SaveScoreUsecaseInput input) async {
    try {
      String currentDate = DateTime.now().toLocal().toString().split(' ')[0];

      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection(users);

      var docSnapshot = await usersCollection.doc(input.userId).get();

      if (docSnapshot.exists) {
        await usersCollection.doc(input.userId).update({
          'completedExercises': FieldValue.increment(input.completedExercises),
          'score': FieldValue.increment(input.score),
          'lastUpdated': currentDate,
        });
      } else {
        await usersCollection.doc(input.userId).set({
          'completedExercises': FieldValue.increment(input.completedExercises),
          'score': FieldValue.increment(input.score),
          'lastUpdated': currentDate,
        });
      }

      CollectionReference scoreCollection =
          FirebaseFirestore.instance.collection(score);

      var scoreSnapshot = await scoreCollection.doc(input.userId).get();

      if (scoreSnapshot.exists) {
        await scoreCollection.doc(input.userId).update({
          'completedExercises': FieldValue.increment(input.completedExercises),
          'score': FieldValue.increment(input.score),
          'date': currentDate,
          'userId': input.userId,
        });
      } else {
        await scoreCollection.doc(input.userId).set({
          'completedExercises': FieldValue.increment(input.completedExercises),
          'score': FieldValue.increment(input.score),
          'date': currentDate,
          'userId': input.userId,
        });
      }

      return SaveScoreUsecaseOutput();
    } catch (e) {
      debugPrint('Error saving streak: $e');
    }

    return SaveScoreUsecaseOutput();
  }

  @override
  Future<SaveStreakUsecaseOutput> saveStreak(
      SaveStreakUsecaseInput input) async {
    try {
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection(users);

      DocumentSnapshot userSnapshot =
          await usersCollection.doc(input.userId).get();

      if (userSnapshot.exists) {
        Map<String, dynamic> userData =
            userSnapshot.data() as Map<String, dynamic>;

        String currentDate = DateTime.now().toLocal().toString().split(' ')[0];

        if (!userData.containsKey('streak')) {
          await usersCollection.doc(input.userId).update({
            'streak': 1,
            'lastUpdated': currentDate,
          });

          return SaveStreakUsecaseOutput();
        }

        if (userData.containsKey('lastUpdated') &&
            userData['lastUpdated'] == currentDate) {
          log('Streak already updated today. Current streak: ${userData['streak']}');
        } else {
          DateTime lastUpdatedDate =
              DateTime.parse(userData['lastUpdated'] ?? '');
          int daysDifference =
              DateTime.now().difference(lastUpdatedDate).inDays;

          if (daysDifference > 1) {
            await usersCollection.doc(input.userId).update({
              'streak': 0,
              'lastUpdated': currentDate,
            });

            log('Streak reset. User skipped a day. daysDifference: $daysDifference , Today: $lastUpdatedDate');
          } else {
            int updatedStreak = userData['streak'] + 1;

            await usersCollection.doc(input.userId).update({
              'streak': updatedStreak,
              'lastUpdated': currentDate,
            });

            log('Streak updated successfully. New streak: $updatedStreak');
          }
        }
      }
    } catch (e) {
      debugPrint('Error saving streak: $e');
    }

    return SaveStreakUsecaseOutput();
  }

  @override
  Future<AwardBadgeUsecaseOutput> awardBadge(
      AwardBadgeUsecaseInput input) async {
    try {
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection(users);

      DocumentSnapshot userSnapshot =
          await usersCollection.doc(input.userId).get();

      if (userSnapshot.exists) {
        Map<String, dynamic> userData =
            userSnapshot.data() as Map<String, dynamic>;

        if (!userData.containsKey('badges')) {
          await usersCollection.doc(input.userId).update({
            'badges': input.badges,
          });

          return AwardBadgeUsecaseOutput();
        }

        if (userData.containsKey('badges')) {
          await usersCollection.doc(input.userId).update({
            'badges': FieldValue.arrayUnion(input.badges),
          });
        }
      }
    } catch (e) {
      debugPrint('Error saving streak: $e');
    }

    return AwardBadgeUsecaseOutput();
  }
}
