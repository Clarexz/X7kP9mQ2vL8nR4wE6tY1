import 'package:equatable/equatable.dart';
import 'routine_exercise.dart';

class Routine extends Equatable {
  final String id;
  final String name;
  final String? description;
  final List<RoutineExercise> exercises;
  final List<String> tags;
  final Duration estimatedDuration;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isFavorite;

  const Routine({
    required this.id,
    required this.name,
    this.description,
    required this.exercises,
    required this.tags,
    required this.estimatedDuration,
    required this.createdAt,
    required this.updatedAt,
    this.isFavorite = false,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        exercises,
        tags,
        estimatedDuration,
        createdAt,
        updatedAt,
        isFavorite,
      ];

  Routine copyWith({
    String? id,
    String? name,
    String? description,
    List<RoutineExercise>? exercises,
    List<String>? tags,
    Duration? estimatedDuration,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isFavorite,
  }) {
    return Routine(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      exercises: exercises ?? this.exercises,
      tags: tags ?? this.tags,
      estimatedDuration: estimatedDuration ?? this.estimatedDuration,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}