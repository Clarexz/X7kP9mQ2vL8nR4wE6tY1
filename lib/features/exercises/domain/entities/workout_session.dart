import 'package:equatable/equatable.dart';
import 'exercise_set.dart';

enum WorkoutStatus {
  notStarted,
  inProgress,
  paused,
  completed,
  cancelled
}

class WorkoutSession extends Equatable {
  final String id;
  final String routineId;
  final String routineName;
  final WorkoutStatus status;
  final List<ExerciseSet> completedSets;
  final DateTime startTime;
  final DateTime? endTime;
  final Duration totalDuration;
  final Duration totalRestTime;
  final String? notes;

  const WorkoutSession({
    required this.id,
    required this.routineId,
    required this.routineName,
    required this.status,
    required this.completedSets,
    required this.startTime,
    this.endTime,
    required this.totalDuration,
    required this.totalRestTime,
    this.notes,
  });

  @override
  List<Object?> get props => [
        id,
        routineId,
        routineName,
        status,
        completedSets,
        startTime,
        endTime,
        totalDuration,
        totalRestTime,
        notes,
      ];

  WorkoutSession copyWith({
    String? id,
    String? routineId,
    String? routineName,
    WorkoutStatus? status,
    List<ExerciseSet>? completedSets,
    DateTime? startTime,
    DateTime? endTime,
    Duration? totalDuration,
    Duration? totalRestTime,
    String? notes,
  }) {
    return WorkoutSession(
      id: id ?? this.id,
      routineId: routineId ?? this.routineId,
      routineName: routineName ?? this.routineName,
      status: status ?? this.status,
      completedSets: completedSets ?? this.completedSets,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      totalDuration: totalDuration ?? this.totalDuration,
      totalRestTime: totalRestTime ?? this.totalRestTime,
      notes: notes ?? this.notes,
    );
  }
}