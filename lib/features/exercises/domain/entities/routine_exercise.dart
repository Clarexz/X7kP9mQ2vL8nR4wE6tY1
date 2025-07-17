import 'package:equatable/equatable.dart';

class RoutineExercise extends Equatable {
  final String exerciseId;
  final String exerciseName;
  final int sets;
  final int? reps;
  final double? weight;
  final Duration? duration;
  final double? distance;
  final Duration restTime;
  final int orderIndex;
  final String? supersetId; // Para agrupar ejercicios en superseries
  final String? notes;

  const RoutineExercise({
    required this.exerciseId,
    required this.exerciseName,
    required this.sets,
    this.reps,
    this.weight,
    this.duration,
    this.distance,
    required this.restTime,
    required this.orderIndex,
    this.supersetId,
    this.notes,
  });

  @override
  List<Object?> get props => [
        exerciseId,
        exerciseName,
        sets,
        reps,
        weight,
        duration,
        distance,
        restTime,
        orderIndex,
        supersetId,
        notes,
      ];

  RoutineExercise copyWith({
    String? exerciseId,
    String? exerciseName,
    int? sets,
    int? reps,
    double? weight,
    Duration? duration,
    double? distance,
    Duration? restTime,
    int? orderIndex,
    String? supersetId,
    String? notes,
  }) {
    return RoutineExercise(
      exerciseId: exerciseId ?? this.exerciseId,
      exerciseName: exerciseName ?? this.exerciseName,
      sets: sets ?? this.sets,
      reps: reps ?? this.reps,
      weight: weight ?? this.weight,
      duration: duration ?? this.duration,
      distance: distance ?? this.distance,
      restTime: restTime ?? this.restTime,
      orderIndex: orderIndex ?? this.orderIndex,
      supersetId: supersetId ?? this.supersetId,
      notes: notes ?? this.notes,
    );
  }
}