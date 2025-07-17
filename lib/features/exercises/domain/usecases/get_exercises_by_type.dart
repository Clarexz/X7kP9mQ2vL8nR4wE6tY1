import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/exercise.dart';
import '../repositories/exercise_repository.dart';

class GetExercisesByType implements UseCase<List<Exercise>, GetExercisesByTypeParams> {
  final ExerciseRepository repository;

  GetExercisesByType(this.repository);

  @override
  Future<Either<Failure, List<Exercise>>> call(GetExercisesByTypeParams params) async {
    return await repository.getExercisesByType(params.type);
  }
}

class GetExercisesByTypeParams extends Equatable {
  final ExerciseType type;

  const GetExercisesByTypeParams({required this.type});

  @override
  List<Object> get props => [type];
}