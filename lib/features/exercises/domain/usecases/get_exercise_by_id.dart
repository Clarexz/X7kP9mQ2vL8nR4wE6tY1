import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/exercise.dart';
import '../repositories/exercise_repository.dart';

class GetExerciseById implements UseCase<Exercise, GetExerciseByIdParams> {
  final ExerciseRepository repository;

  GetExerciseById(this.repository);

  @override
  Future<Either<Failure, Exercise>> call(GetExerciseByIdParams params) async {
    return await repository.getExerciseById(params.id);
  }
}

class GetExerciseByIdParams extends Equatable {
  final String id;

  const GetExerciseByIdParams({required this.id});

  @override
  List<Object> get props => [id];
}