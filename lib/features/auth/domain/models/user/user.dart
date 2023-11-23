import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String name;
  final String email;
  final String id;
  final int? streak;
  final int? score;
  final int? completedExercises;
  final String? lastUpdated;
  final List<String>? badges;

  UserModel({
    required this.name,
    required this.email,
    required this.id,
    this.streak,
    this.completedExercises,
    this.score,
    this.lastUpdated,
    this.badges,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'id': id,
      'score': score,
      'completedExercises': completedExercises,
      'streak': streak,
      'lastUpdated': lastUpdated,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      id: json['id'],
      streak: json['streak'],
      score: json['score'],
      completedExercises: json['completedExercises'],
      lastUpdated: json['lastUpdated'],
    );
  }

  factory UserModel.fromFirestore(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    return UserModel(
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      id: data['id'] ?? '',
      streak: data['streak'] ?? 0,
      completedExercises: data['completedExercises'] ?? 0,
      score: data['score'] ?? 0,
      lastUpdated: data['lastUpdated'] ?? '',
      badges: data['badges'] != null
          ? List<String>.from(data['badges'])
          : null, // Parse badges field
    );
  }

  UserModel copyWith({
    String? name,
    String? email,
    String? id,
    int? streak,
    int? completedExercises,
    int? score,
    String? lastUpdated,
    List<String>? badges,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      id: id ?? this.id,
      streak: streak ?? this.streak,
      completedExercises: completedExercises ?? this.completedExercises,
      score: score ?? this.score,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      badges: badges ?? this.badges,
    );
  }
}
