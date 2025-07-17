import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/exercise_repository.dart';

class DeleteExercise implements UseCase<void, DeleteExerciseParams> {
  final ExerciseRepository repository;

  DeleteExercise(this.repository);

  @override
  Future<Either<Failure, void>> call(DeleteExerciseParams params) async {
    if (params.id.trim().isEmpty) {
      return Left(ValidationFailure('ID de ejercicio inválido'));
    }

    // Verificar que el ejercicio existe antes de eliminarlo
    final exerciseResult = await repository.getExerciseById(params.id);
    return exerciseResult.fold(
      (failure) => Left(failure),
      (exercise) async {
        // Solo permitir eliminar ejercicios personalizados
        if (!exercise.isCustom) {
          return Left(ValidationFailure('No se pueden eliminar ejercicios predefinidos'));
        }

        return await repository.deleteExercise(params.id);
      },
    );
  }
}

class DeleteExerciseParams extends Equatable {
  final String id;

  const DeleteExerciseParams({required this.id});

  @override
  List<Object> get props => [id];
}