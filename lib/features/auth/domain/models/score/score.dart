import 'package:cloud_firestore/cloud_firestore.dart';

class Score {
  final String id;
  final String name;
  final int? score;
  final int? completedExercises;
  final String? lastUpdated;

  Score({
    required this.id,
    required this.name,
    this.completedExercises,
    this.score,
    this.lastUpdated,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'score': score,
      'completedExercises': completedExercises,
      'date': lastUpdated,
    };
  }

  factory Score.fromJson(Map<String, dynamic> json) {
    return Score(
      id: json['id'],
      name: json['name'],
      score: json['score'],
      completedExercises: json['completedExercises'],
      lastUpdated: json['date'],
    );
  }

  factory Score.fromFirestore(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    return Score(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      completedExercises: data['completedExercises'] ?? 0,
      score: data['score'] ?? 0,
      lastUpdated: data['date'] ?? '',
    );
  }

  Score copyWith({
    String? id,
    String? name,
    int? streak,
    int? completedExercises,
    int? score,
    String? lastUpdated,
  }) {
    return Score(
      id: id ?? this.id,
      name: name ?? this.name,
      completedExercises: completedExercises ?? this.completedExercises,
      score: score ?? this.score,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}
