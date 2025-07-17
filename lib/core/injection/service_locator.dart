import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';
import '../../shared/services/database_service.dart';
import '../../features/exercises/data/datasources/exercise_local_datasource.dart';
import '../../features/exercises/data/repositories/exercise_repository_impl.dart';
import '../../features/exercises/domain/repositories/exercise_repository.dart';
import '../../features/exercises/domain/usecases/get_exercises.dart';
import '../../features/exercises/domain/usecases/get_exercise_by_id.dart';
import '../../features/exercises/domain/usecases/search_exercises.dart';
import '../../features/exercises/domain/usecases/create_exercise.dart';
import '../../features/exercises/domain/usecases/update_exercise.dart';
import '../../features/exercises/domain/usecases/delete_exercise.dart';
import '../../features/exercises/domain/usecases/get_exercises_by_type.dart';
import '../../features/exercises/domain/usecases/get_exercises_by_muscle_group.dart';
import '../../features/exercises/domain/usecases/get_exercise_tags.dart';
import '../../features/exercises/domain/usecases/create_exercise_tag.dart';

final sl = GetIt.instance; // Service Locator instance

Future<void> initializeDependencies() async {
  // =============================================
  // Core Services
  // =============================================
  
  // Database
  sl.registerLazySingletonAsync<Database>(() async {
    return await DatabaseService.initializeDatabase();
  });
  
  sl.registerLazySingleton<DatabaseService>(
    () => DatabaseService(),
  );

  // =============================================
  // Data Sources
  // =============================================
  
  // Exercise Data Sources
  sl.registerLazySingleton<ExerciseLocalDataSource>(
    () => ExerciseLocalDataSourceImpl(
      databaseService: sl<DatabaseService>(),
    ),
  );

  // =============================================
  // Repositories (Data Layer)
  // =============================================
  
  // Exercise Repository
  sl.registerLazySingleton<ExerciseRepository>(
    () => ExerciseRepositoryImpl(
      localDataSource: sl<ExerciseLocalDataSource>(),
    ),
  );

  // =============================================
  // Use Cases (Domain Layer)
  // =============================================
  
  // Exercise Use Cases
  sl.registerLazySingleton(() => GetExercises(sl<ExerciseRepository>()));
  sl.registerLazySingleton(() => GetExerciseById(sl<ExerciseRepository>()));
  sl.registerLazySingleton(() => SearchExercises(sl<ExerciseRepository>()));
  sl.registerLazySingleton(() => CreateExercise(sl<ExerciseRepository>()));
  sl.registerLazySingleton(() => UpdateExercise(sl<ExerciseRepository>()));
  sl.registerLazySingleton(() => DeleteExercise(sl<ExerciseRepository>()));
  sl.registerLazySingleton(() => GetExercisesByType(sl<ExerciseRepository>()));
  sl.registerLazySingleton(() => GetExercisesByMuscleGroup(sl<ExerciseRepository>()));
  sl.registerLazySingleton(() => GetExerciseTags(sl<ExerciseRepository>()));
  sl.registerLazySingleton(() => CreateExerciseTag(sl<ExerciseRepository>()));

  // =============================================
  // Blocs (Presentation Layer)
  // =============================================
  // Se registrarán cuando creemos los blocs
  
  // =============================================
  // External Dependencies
  // =============================================
  // Aquí se registrarán servicios externos como Firebase, APIs, etc.
  
  // Wait for async dependencies to be ready
  await sl.allReady();
}