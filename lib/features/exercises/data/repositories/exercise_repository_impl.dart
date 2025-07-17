import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/exercise.dart';
import '../../domain/entities/exercise_tag.dart';
import '../../domain/repositories/exercise_repository.dart';
import '../datasources/exercise_local_datasource.dart';
import '../models/exercise_model.dart';
import '../models/exercise_tag_model.dart';

class ExerciseRepositoryImpl implements ExerciseRepository {
  final ExerciseLocalDataSource localDataSource;

  ExerciseRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<Exercise>>> getExercises() async {
    try {
      final exercises = await localDataSource.getExercises();
      return Right(exercises);
    } catch (e) {
      return Left(DatabaseFailure('Error al obtener ejercicios: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Exercise>> getExerciseById(String id) async {
    try {
      final exercise = await localDataSource.getExerciseById(id);
      if (exercise == null) {
        return Left(NotFoundFailure('Ejercicio no encontrado'));
      }
      return Right(exercise);
    } catch (e) {
      return Left(DatabaseFailure('Error al obtener ejercicio: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<Exercise>>> searchExercises(String query) async {
    try {
      if (query.trim().isEmpty) {
        return getExercises();
      }
      final exercises = await localDataSource.searchExercises(query.trim());
      return Right(exercises);
    } catch (e) {
      return Left(DatabaseFailure('Error al buscar ejercicios: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<Exercise>>> getExercisesByType(ExerciseType type) async {
    try {
      final exercises = await localDataSource.getExercisesByType(type);
      return Right(exercises);
    } catch (e) {
      return Left(DatabaseFailure('Error al filtrar ejercicios: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<Exercise>>> getExercisesByMuscleGroup(String muscleGroup) async {
    try {
      final exercises = await localDataSource.getExercisesByMuscleGroup(muscleGroup);
      return Right(exercises);
    } catch (e) {
      return Left(DatabaseFailure('Error al filtrar ejercicios: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Exercise>> createExercise(Exercise exercise) async {
    try {
      final exerciseModel = ExerciseModel.fromEntity(exercise);
      final createdExercise = await localDataSource.createExercise(exerciseModel);
      return Right(createdExercise);
    } catch (e) {
      return Left(DatabaseFailure('Error al crear ejercicio: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Exercise>> updateExercise(Exercise exercise) async {
    try {
      final exerciseModel = ExerciseModel.fromEntity(exercise);
      final updatedExercise = await localDataSource.updateExercise(exerciseModel);
      return Right(updatedExercise);
    } catch (e) {
      return Left(DatabaseFailure('Error al actualizar ejercicio: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteExercise(String id) async {
    try {
      await localDataSource.deleteExercise(id);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Error al eliminar ejercicio: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<ExerciseTag>>> getExerciseTags() async {
    try {
      final tags = await localDataSource.getExerciseTags();
      return Right(tags);
    } catch (e) {
      return Left(DatabaseFailure('Error al obtener tags: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, ExerciseTag>> createExerciseTag(ExerciseTag tag) async {
    try {
      final tagModel = ExerciseTagModel.fromEntity(tag);
      final createdTag = await localDataSource.createExerciseTag(tagModel);
      return Right(createdTag);
    } catch (e) {
      return Left(DatabaseFailure('Error al crear tag: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteExerciseTag(String id) async {
    try {
      await localDataSource.deleteExerciseTag(id);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Error al eliminar tag: ${e.toString()}'));
    }
  }
}