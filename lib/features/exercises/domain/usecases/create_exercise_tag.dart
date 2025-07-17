import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../shared/utils/helpers.dart';
import '../entities/exercise_tag.dart';
import '../repositories/exercise_repository.dart';

class CreateExerciseTag implements UseCase<ExerciseTag, CreateExerciseTagParams> {
  final ExerciseRepository repository;

  CreateExerciseTag(this.repository);

  @override
  Future<Either<Failure, ExerciseTag>> call(CreateExerciseTagParams params) async {
    if (params.name.trim().isEmpty) {
      return Left(ValidationFailure('El nombre del tag es obligatorio'));
    }

    if (params.name.trim().length < 2) {
      return Left(ValidationFailure('El nombre debe tener al menos 2 caracteres'));
    }

    final tag = ExerciseTag(
      id: Helpers.generateId(),
      name: params.name.trim(),
      color: params.color,
      createdAt: DateTime.now(),
    );

    return await repository.createExerciseTag(tag);
  }
}

class CreateExerciseTagParams extends Equatable {
  final String name;
  final Color color;

  const CreateExerciseTagParams({
    required this.name,
    required this.color,
  });

  @override
  List<Object> get props => [name, color];
}