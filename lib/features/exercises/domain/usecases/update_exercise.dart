import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/validators.dart';
import '../entities/exercise.dart';
import '../repositories/exercise_repository.dart';

class UpdateExercise implements UseCase<Exercise, UpdateExerciseParams> {
  final ExerciseRepository repository;

  UpdateExercise(this.repository);

  @override
  Future<Either<Failure, Exercise>> call(UpdateExerciseParams params) async {
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

    // Obtener el ejercicio existente
    final existingExerciseResult = await repository.getExerciseById(params.id);
    return existingExerciseResult.fold(
      (failure) => Left(failure),
      (existingExercise) async {
        // Actualizar el ejercicio
        final updatedExercise = existingExercise.copyWith(
          name: params.name.trim(),
          description: params.description.trim(),
          type: params.type,
          muscleGroups: params.muscleGroups,
          tags: params.tags,
          updatedAt: DateTime.now(),
        );

        return await repository.updateExercise(updatedExercise);
      },
    );
  }
}

class UpdateExerciseParams extends Equatable {
  final String id;
  final String name;
  final String description;
  final ExerciseType type;
  final List<String> muscleGroups;
  final List<String> tags;

  const UpdateExerciseParams({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.muscleGroups,
    required this.tags,
  });

  @override
  List<Object> get props => [id, name, description, type, muscleGroups, tags];
}