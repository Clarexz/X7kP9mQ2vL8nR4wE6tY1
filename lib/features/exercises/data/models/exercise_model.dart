import 'package:flutter/material.dart';
import '../../domain/entities/exercise.dart';

class ExerciseModel extends Exercise {
  const ExerciseModel({
    required super.id,
    required super.name,
    required super.description,
    required super.type,
    required super.muscleGroups,
    required super.tags,
    required super.createdAt,
    required super.updatedAt,
    super.isCustom,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      type: ExerciseType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => ExerciseType.bodyweight,
      ),
      muscleGroups: (json['muscle_groups'] as String)
          .split(',')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList(),
      tags: (json['tags'] as String)
          .split(',')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList(),
      createdAt: DateTime.fromMillisecondsSinceEpoch(json['created_at'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(json['updated_at'] as int),
      isCustom: (json['is_custom'] as int) == 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'type': type.name,
      'muscle_groups': muscleGroups.join(','),
      'tags': tags.join(','),
      'created_at': createdAt.millisecondsSinceEpoch,
      'updated_at': updatedAt.millisecondsSinceEpoch,
      'is_custom': isCustom ? 1 : 0,
    };
  }

  factory ExerciseModel.fromEntity(Exercise exercise) {
    return ExerciseModel(
      id: exercise.id,
      name: exercise.name,
      description: exercise.description,
      type: exercise.type,
      muscleGroups: exercise.muscleGroups,
      tags: exercise.tags,
      createdAt: exercise.createdAt,
      updatedAt: exercise.updatedAt,
      isCustom: exercise.isCustom,
    );
  }
}