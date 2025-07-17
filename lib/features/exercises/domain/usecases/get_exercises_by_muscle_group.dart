import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/exercise.dart';
import '../repositories/exercise_repository.dart';

class GetExercisesByMuscleGroup implements UseCase<List<Exercise>, GetExercisesByMuscleGroupParams> {
  final ExerciseRepository repository;

  GetExercisesByMuscleGroup(this.repository);

  @override
  Future<Either<Failure, List<Exercise>>> call(GetExercisesByMuscleGroupParams params) async {
    if (params.muscleGroup.trim().isEmpty) {
      return Left(ValidationFailure('El grupo muscular no puede estar vacío'));
    }
    return await repository.getExercisesByMuscleGroup(params.muscleGroup);
  }
}

class GetExercisesByMuscleGroupParams extends Equatable {
  final String muscleGroup;

  const GetExercisesByMuscleGroupParams({required this.muscleGroup});

  @override
  List<Object> get props => [muscleGroup];
}