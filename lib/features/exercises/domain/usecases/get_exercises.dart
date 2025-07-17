import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/exercise.dart';
import '../repositories/exercise_repository.dart';

class GetExercises implements UseCaseNoParams<List<Exercise>> {
  final ExerciseRepository repository;

  GetExercises(this.repository);

  @override
  Future<Either<Failure, List<Exercise>>> call() async {
    return await repository.getExercises();
  }
}