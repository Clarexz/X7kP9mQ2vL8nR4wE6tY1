import 'package:equatable/equatable.dart';

class UserStats extends Equatable {
  final int totalWorkouts;
  final Duration totalWorkoutTime;
  final int currentStreak;
  final int longestStreak;
  final int totalExercisesCreated;
  final int totalRoutinesCreated;
  final Map<String, int> exerciseStats; // exerciseId -> times performed
  final DateTime lastUpdated;

  const UserStats({
    required this.totalWorkouts,
    required this.totalWorkoutTime,
    required this.currentStreak,
    required this.longestStreak,
    required this.totalExercisesCreated,
    required this.totalRoutinesCreated,
    required this.exerciseStats,
    required this.lastUpdated,
  });

  @override
  List<Object?> get props => [
        totalWorkouts,
        totalWorkoutTime,
        currentStreak,
        longestStreak,
        totalExercisesCreated,
        totalRoutinesCreated,
        exerciseStats,
        lastUpdated,
      ];

  UserStats copyWith({
    int? totalWorkouts,
    Duration? totalWorkoutTime,
    int? currentStreak,
    int? longestStreak,
    int? totalExercisesCreated,
    int? totalRoutinesCreated,
    Map<String, int>? exerciseStats,
    DateTime? lastUpdated,
  }) {
    return UserStats(
      totalWorkouts: totalWorkouts ?? this.totalWorkouts,
      totalWorkoutTime: totalWorkoutTime ?? this.totalWorkoutTime,
      currentStreak: currentStreak ?? this.currentStreak,
      longestStreak: longestStreak ?? this.longestStreak,
      totalExercisesCreated: totalExercisesCreated ?? this.totalExercisesCreated,
      totalRoutinesCreated: totalRoutinesCreated ?? this.totalRoutinesCreated,
      exerciseStats: exerciseStats ?? this.exerciseStats,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}