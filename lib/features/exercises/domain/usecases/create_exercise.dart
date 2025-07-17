import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/validators.dart';
import '../../../../shared/utils/helpers.dart';
import '../entities/exercise.dart';
import '../repositories/exercise_repository.dart';

class CreateExercise implements UseCase<Exercise, CreateExerciseParams> {
  final ExerciseRepository repository;

  CreateExercise(this.repository);

  @override
  Future<Either<Failure, Exercise>> call(CreateExerciseParams params) async {
    // Validar datos de entrada
    final nameValidation = Validators.validateExerciseName(params.name);
    if (nameValidation != null) {
      return Left(ValidationFailure(nameValidation));
    }

    if (params.description.trim().isEmpty) {
      return Left(ValidationFailure('La descripción es obligatoria'));
    }

    if (params.muscleGroups.isEmpty) {
      return Left(ValidationFailure('Debe seleccionar al menos un grupo muscular'));
    }

    // Crear el ejercicio
    final exercise = Exercise(
      id: Helpers.generateId(),
      name: params.name.trim(),
      description: params.description.trim(),
      type: params.type,
      muscleGroups: params.muscleGroups,
      tags: params.tags,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      isCustom: true,
    );

    return await repository.createExercise(exercise);
  }
}

class CreateExerciseParams extends Equatable {
  final String name;
  final String description;
  final ExerciseType type;
  final List<String> muscleGroups;
  final List<String> tags;

  const CreateExerciseParams({
    required this.name,
    required this.description,
    required this.type,
    required this.muscleGroups,
    required this.tags,
  });

  @override
  List<Object> get props => [name, description, type, muscleGroups, tags];
}