import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/exercise.dart';
import '../entities/exercise_tag.dart';

abstract class ExerciseRepository {
  Future<Either<Failure, List<Exercise>>> getExercises();
  Future<Either<Failure, Exercise>> getExerciseById(String id);
  Future<Either<Failure, List<Exercise>>> searchExercises(String query);
  Future<Either<Failure, List<Exercise>>> getExercisesByType(ExerciseType type);
  Future<Either<Failure, List<Exercise>>> getExercisesByMuscleGroup(String muscleGroup);
  Future<Either<Failure, Exercise>> createExercise(Exercise exercise);
  Future<Either<Failure, Exercise>> updateExercise(Exercise exercise);
  Future<Either<Failure, void>> deleteExercise(String id);
  Future<Either<Failure, List<ExerciseTag>>> getExerciseTags();
  Future<Either<Failure, ExerciseTag>> createExerciseTag(ExerciseTag tag);
  Future<Either<Failure, void>> deleteExerciseTag(String id);
}