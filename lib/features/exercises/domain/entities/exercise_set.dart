import 'package:equatable/equatable.dart';

enum SetType {
  normal,
  warmup,
  dropset,
  failure
}

class ExerciseSet extends Equatable {
  final String id;
  final String exerciseId;
  final String exerciseName;
  final int setNumber;
  final SetType type;
  final int? reps;
  final double? weight;
  final Duration? duration;
  final double? distance;
  final bool isCompleted;
  final DateTime? completedAt;
  final int? rpe; // Rate of Perceived Exertion (1-10)
  final String? notes;

  const ExerciseSet({
    required this.id,
    required this.exerciseId,
    required this.exerciseName,
    required this.setNumber,
    this.type = SetType.normal,
    this.reps,
    this.weight,
    this.duration,
    this.distance,
    this.isCompleted = false,
    this.completedAt,
    this.rpe,
    this.notes,
  });

  @override
  List<Object?> get props => [
        id,
        exerciseId,
        exerciseName,
        setNumber,
        type,
        reps,
        weight,
        duration,
        distance,
        isCompleted,
        completedAt,
        rpe,
        notes,
      ];

  ExerciseSet copyWith({
    String? id,
    String? exerciseId,
    String? exerciseName,
    int? setNumber,
    SetType? type,
    int? reps,
    double? weight,
    Duration? duration,
    double? distance,
    bool? isCompleted,
    DateTime? completedAt,
    int? rpe,
    String? notes,
  }) {
    return ExerciseSet(
      id: id ?? this.id,
      exerciseId: exerciseId ?? this.exerciseId,
      exerciseName: exerciseName ?? this.exerciseName,
      setNumber: setNumber ?? this.setNumber,
      type: type ?? this.type,
      reps: reps ?? this.reps,
      weight: weight ?? this.weight,
      duration: duration ?? this.duration,
      distance: distance ?? this.distance,
      isCompleted: isCompleted ?? this.isCompleted,
      completedAt: completedAt ?? this.completedAt,
      rpe: rpe ?? this.rpe,
      notes: notes ?? this.notes,
    );
  }
}