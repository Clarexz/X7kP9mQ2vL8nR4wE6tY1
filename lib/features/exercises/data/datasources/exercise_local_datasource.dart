import '../../../../shared/services/database_service.dart';
import '../models/exercise_model.dart';
import '../models/exercise_tag_model.dart';
import '../../domain/entities/exercise.dart';

abstract class ExerciseLocalDataSource {
  Future<List<ExerciseModel>> getExercises();
  Future<ExerciseModel?> getExerciseById(String id);
  Future<List<ExerciseModel>> searchExercises(String query);
  Future<List<ExerciseModel>> getExercisesByType(ExerciseType type);
  Future<List<ExerciseModel>> getExercisesByMuscleGroup(String muscleGroup);
  Future<ExerciseModel> createExercise(ExerciseModel exercise);
  Future<ExerciseModel> updateExercise(ExerciseModel exercise);
  Future<void> deleteExercise(String id);
  Future<List<ExerciseTagModel>> getExerciseTags();
  Future<ExerciseTagModel> createExerciseTag(ExerciseTagModel tag);
  Future<void> deleteExerciseTag(String id);
}

class ExerciseLocalDataSourceImpl implements ExerciseLocalDataSource {
  final DatabaseService databaseService;

  ExerciseLocalDataSourceImpl({required this.databaseService});

  @override
  Future<List<ExerciseModel>> getExercises() async {
    final results = await databaseService.query(
      'exercises',
      orderBy: 'name ASC',
    );
    return results.map((json) => ExerciseModel.fromJson(json)).toList();
  }

  @override
  Future<ExerciseModel?> getExerciseById(String id) async {
    final results = await databaseService.query(
      'exercises',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (results.isEmpty) return null;
    return ExerciseModel.fromJson(results.first);
  }

  @override
  Future<List<ExerciseModel>> searchExercises(String query) async {
    final results = await databaseService.query(
      'exercises',
      where: 'LOWER(name) LIKE ? OR LOWER(description) LIKE ? OR LOWER(tags) LIKE ?',
      whereArgs: ['%${query.toLowerCase()}%', '%${query.toLowerCase()}%', '%${query.toLowerCase()}%'],
      orderBy: 'name ASC',
    );
    return results.map((json) => ExerciseModel.fromJson(json)).toList();
  }

  @override
  Future<List<ExerciseModel>> getExercisesByType(ExerciseType type) async {
    final results = await databaseService.query(
      'exercises',
      where: 'type = ?',
      whereArgs: [type.name],
      orderBy: 'name ASC',
    );
    return results.map((json) => ExerciseModel.fromJson(json)).toList();
  }

  @override
  Future<List<ExerciseModel>> getExercisesByMuscleGroup(String muscleGroup) async {
    final results = await databaseService.query(
      'exercises',
      where: 'muscle_groups LIKE ?',
      whereArgs: ['%$muscleGroup%'],
      orderBy: 'name ASC',
    );
    return results.map((json) => ExerciseModel.fromJson(json)).toList();
  }

  @override
  Future<ExerciseModel> createExercise(ExerciseModel exercise) async {
    await databaseService.insert('exercises', exercise.toJson());
    return exercise;
  }

  @override
  Future<ExerciseModel> updateExercise(ExerciseModel exercise) async {
    await databaseService.update(
      'exercises',
      exercise.toJson(),
      where: 'id = ?',
      whereArgs: [exercise.id],
    );
    return exercise;
  }

  @override
  Future<void> deleteExercise(String id) async {
    await databaseService.delete(
      'exercises',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<List<ExerciseTagModel>> getExerciseTags() async {
    final results = await databaseService.query(
      'exercise_tags',
      orderBy: 'name ASC',
    );
    return results.map((json) => ExerciseTagModel.fromJson(json)).toList();
  }

  @override
  Future<ExerciseTagModel> createExerciseTag(ExerciseTagModel tag) async {
    await databaseService.insert('exercise_tags', tag.toJson());
    return tag;
  }

  @override
  Future<void> deleteExerciseTag(String id) async {
    await databaseService.delete(
      'exercise_tags',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}