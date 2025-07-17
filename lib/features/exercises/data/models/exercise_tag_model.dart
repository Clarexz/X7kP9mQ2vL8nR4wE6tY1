import 'package:flutter/material.dart';
import '../../domain/entities/exercise_tag.dart';

class ExerciseTagModel extends ExerciseTag {
  const ExerciseTagModel({
    required super.id,
    required super.name,
    required super.color,
    required super.createdAt,
  });

  factory ExerciseTagModel.fromJson(Map<String, dynamic> json) {
    return ExerciseTagModel(
      id: json['id'] as String,
      name: json['name'] as String,
      color: Color(json['color_value'] as int),
      createdAt: DateTime.fromMillisecondsSinceEpoch(json['created_at'] as int),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'color_value': color.value,
      'created_at': createdAt.millisecondsSinceEpoch,
    };
  }

  factory ExerciseTagModel.fromEntity(ExerciseTag tag) {
    return ExerciseTagModel(
      id: tag.id,
      name: tag.name,
      color: tag.color,
      createdAt: tag.createdAt,
    );
  }
}