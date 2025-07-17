import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ExerciseTag extends Equatable {
  final String id;
  final String name;
  final Color color;
  final DateTime createdAt;

  const ExerciseTag({
    required this.id,
    required this.name,
    required this.color,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, name, color, createdAt];

  ExerciseTag copyWith({
    String? id,
    String? name,
    Color? color,
    DateTime? createdAt,
  }) {
    return ExerciseTag(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}