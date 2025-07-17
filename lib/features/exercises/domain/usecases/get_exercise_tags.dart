import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/exercise_tag.dart';
import '../repositories/exercise_repository.dart';

class GetExerciseTags implements UseCaseNoParams<List<ExerciseTag>> {
  final ExerciseRepository repository;

  GetExerciseTags(this.repository);

  @override
  Future<Either<Failure, List<ExerciseTag>>> call() async {
    return await repository.getExerciseTags();
  }
}