import 'package:equatable/equatable.dart';

enum ExerciseType {
  weight,      // Con peso (kg/lb)
  bodyweight,  // Peso corporal (solo reps)
  time,        // Por tiempo (segundos/minutos)
  distance     // Por distancia (metros/km)
}

class Exercise extends Equatable {
  final String id;
  final String name;
  final String description;
  final ExerciseType type;
  final List<String> muscleGroups;
  final List<String> tags;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isCustom;

  const Exercise({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.muscleGroups,
    required this.tags,
    required this.createdAt,
    required this.updatedAt,
    this.isCustom = true,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        type,
        muscleGroups,
        tags,
        createdAt,
        updatedAt,
        isCustom,
      ];

  Exercise copyWith({
    String? id,
    String? name,
    String? description,
    ExerciseType? type,
    List<String>? muscleGroups,
    List<String>? tags,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isCustom,
  }) {
    return Exercise(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      muscleGroups: muscleGroups ?? this.muscleGroups,
      tags: tags ?? this.tags,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isCustom: isCustom ?? this.isCustom,
    );
  }
}