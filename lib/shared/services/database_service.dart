import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../core/constants/app_constants.dart';

class DatabaseService {
  static Database? _database;

  static Future<Database> initializeDatabase() async {
    if (_database != null) return _database!;

    final databasePath = await getDatabasesPath();
    final path = join(databasePath, AppConstants.databaseName);

    _database = await openDatabase(
      path,
      version: AppConstants.databaseVersion,
      onCreate: _createDatabase,
      onUpgrade: _upgradeDatabase,
    );

    return _database!;
  }

  static Future<void> _createDatabase(Database db, int version) async {
    // Crear tabla de ejercicios
    await db.execute('''
      CREATE TABLE exercises (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        description TEXT NOT NULL,
        type TEXT NOT NULL,
        muscle_groups TEXT NOT NULL,
        tags TEXT NOT NULL,
        created_at INTEGER NOT NULL,
        updated_at INTEGER NOT NULL,
        is_custom INTEGER NOT NULL DEFAULT 1
      )
    ''');

    // Crear tabla de tags de ejercicios
    await db.execute('''
      CREATE TABLE exercise_tags (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL UNIQUE,
        color_value INTEGER NOT NULL,
        created_at INTEGER NOT NULL
      )
    ''');

    // Crear tabla de rutinas
    await db.execute('''
      CREATE TABLE routines (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        description TEXT,
        tags TEXT NOT NULL,
        estimated_duration INTEGER NOT NULL,
        created_at INTEGER NOT NULL,
        updated_at INTEGER NOT NULL,
        is_favorite INTEGER NOT NULL DEFAULT 0
      )
    ''');

    // Crear tabla de ejercicios en rutinas
    await db.execute('''
      CREATE TABLE routine_exercises (
        id TEXT PRIMARY KEY,
        routine_id TEXT NOT NULL,
        exercise_id TEXT NOT NULL,
        exercise_name TEXT NOT NULL,
        sets INTEGER NOT NULL,
        reps INTEGER,
        weight REAL,
        duration INTEGER,
        distance REAL,
        rest_time INTEGER NOT NULL,
        order_index INTEGER NOT NULL,
        superset_id TEXT,
        notes TEXT,
        FOREIGN KEY (routine_id) REFERENCES routines (id) ON DELETE CASCADE,
        FOREIGN KEY (exercise_id) REFERENCES exercises (id) ON DELETE CASCADE
      )
    ''');

    // Crear tabla de sesiones de entrenamiento
    await db.execute('''
      CREATE TABLE workout_sessions (
        id TEXT PRIMARY KEY,
        routine_id TEXT NOT NULL,
        routine_name TEXT NOT NULL,
        status TEXT NOT NULL,
        start_time INTEGER NOT NULL,
        end_time INTEGER,
        total_duration INTEGER NOT NULL DEFAULT 0,
        total_rest_time INTEGER NOT NULL DEFAULT 0,
        notes TEXT,
        FOREIGN KEY (routine_id) REFERENCES routines (id)
      )
    ''');

    // Crear tabla de sets de ejercicios
    await db.execute('''
      CREATE TABLE exercise_sets (
        id TEXT PRIMARY KEY,
        workout_session_id TEXT NOT NULL,
        exercise_id TEXT NOT NULL,
        exercise_name TEXT NOT NULL,
        set_number INTEGER NOT NULL,
        type TEXT NOT NULL DEFAULT 'normal',
        reps INTEGER,
        weight REAL,
        duration INTEGER,
        distance REAL,
        is_completed INTEGER NOT NULL DEFAULT 0,
        completed_at INTEGER,
        rpe INTEGER,
        notes TEXT,
        FOREIGN KEY (workout_session_id) REFERENCES workout_sessions (id) ON DELETE CASCADE,
        FOREIGN KEY (exercise_id) REFERENCES exercises (id)
      )
    ''');

    // Crear tabla de perfil de usuario
    await db.execute('''
      CREATE TABLE user_profile (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        email TEXT,
        photo_url TEXT,
        weight_unit TEXT NOT NULL DEFAULT 'kg',
        distance_unit TEXT NOT NULL DEFAULT 'meters',
        join_date INTEGER NOT NULL,
        last_active_date INTEGER NOT NULL,
        is_premium INTEGER NOT NULL DEFAULT 0,
        premium_expiry_date INTEGER
      )
    ''');

    // Crear tabla de estadísticas de usuario
    await db.execute('''
      CREATE TABLE user_stats (
        id TEXT PRIMARY KEY DEFAULT 'main',
        total_workouts INTEGER NOT NULL DEFAULT 0,
        total_workout_time INTEGER NOT NULL DEFAULT 0,
        current_streak INTEGER NOT NULL DEFAULT 0,
        longest_streak INTEGER NOT NULL DEFAULT 0,
        total_exercises_created INTEGER NOT NULL DEFAULT 0,
        total_routines_created INTEGER NOT NULL DEFAULT 0,
        exercise_stats TEXT NOT NULL DEFAULT '{}',
        last_updated INTEGER NOT NULL
      )
    ''');

    // Crear tabla de configuraciones
    await db.execute('''
      CREATE TABLE app_settings (
        id TEXT PRIMARY KEY DEFAULT 'main',
        theme_mode TEXT NOT NULL DEFAULT 'dark',
        language TEXT NOT NULL DEFAULT 'es',
        notifications_enabled INTEGER NOT NULL DEFAULT 1,
        sound_enabled INTEGER NOT NULL DEFAULT 1,
        vibration_enabled INTEGER NOT NULL DEFAULT 1,
        auto_rest_timer INTEGER NOT NULL DEFAULT 1,
        default_rest_time INTEGER NOT NULL DEFAULT 60,
        weight_unit TEXT NOT NULL DEFAULT 'kg',
        distance_unit TEXT NOT NULL DEFAULT 'meters'
      )
    ''');

    // Insertar datos iniciales
    await _insertInitialData(db);
  }

  static Future<void> _upgradeDatabase(Database db, int oldVersion, int newVersion) async {
    // Aquí se manejarán las migraciones de la base de datos en futuras versiones
    if (oldVersion < newVersion) {
      // Ejemplo de migración:
      // if (oldVersion < 2) {
      //   await db.execute('ALTER TABLE exercises ADD COLUMN new_field TEXT');
      // }
    }
  }

  static Future<void> _insertInitialData(Database db) async {
    // Insertar tags de grupos musculares por defecto
    final defaultTags = [
      {'id': 'pectorales', 'name': 'Pectorales', 'color': 0xFFFF6B6B},
      {'id': 'triceps', 'name': 'Tríceps', 'color': 0xFFFFCE54},
      {'id': 'deltoides', 'name': 'Deltoides', 'color': 0xFF4ECDC4},
      {'id': 'laterales', 'name': 'Laterales', 'color': 0xFFABEBC6},
      {'id': 'biceps', 'name': 'Bíceps', 'color': 0xFFA29BFE},
      {'id': 'trapecios', 'name': 'Trapecios', 'color': 0xFFDDD6FE},
      {'id': 'piernas', 'name': 'Piernas', 'color': 0xFFFF9FF3},
      {'id': 'espalda', 'name': 'Espalda', 'color': 0xFF6C5CE7},
    ];

    for (final tag in defaultTags) {
      await db.insert('exercise_tags', {
        'id': tag['id'],
        'name': tag['name'],
        'color_value': tag['color'],
        'created_at': DateTime.now().millisecondsSinceEpoch,
      });
    }

    // Insertar configuraciones por defecto
    await db.insert('app_settings', {
      'id': 'main',
      'theme_mode': 'dark',
      'language': 'es',
      'notifications_enabled': 1,
      'sound_enabled': 1,
      'vibration_enabled': 1,
      'auto_rest_timer': 1,
      'default_rest_time': 60,
      'weight_unit': 'kg',
      'distance_unit': 'meters',
    });

    // Insertar estadísticas iniciales del usuario
    await db.insert('user_stats', {
      'id': 'main',
      'total_workouts': 0,
      'total_workout_time': 0,
      'current_streak': 0,
      'longest_streak': 0,
      'total_exercises_created': 0,
      'total_routines_created': 0,
      'exercise_stats': '{}',
      'last_updated': DateTime.now().millisecondsSinceEpoch,
    });
  }

  // Métodos de utilidad para la base de datos
  Future<List<Map<String, dynamic>>> query(
    String table, {
    bool? distinct,
    List<String>? columns,
    String? where,
    List<Object?>? whereArgs,
    String? groupBy,
    String? having,
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    final db = await initializeDatabase();
    return await db.query(
      table,
      distinct: distinct,
      columns: columns,
      where: where,
      whereArgs: whereArgs,
      groupBy: groupBy,
      having: having,
      orderBy: orderBy,
      limit: limit,
      offset: offset,
    );
  }

  Future<int> insert(String table, Map<String, Object?> values) async {
    final db = await initializeDatabase();
    return await db.insert(table, values);
  }

  Future<int> update(
    String table,
    Map<String, Object?> values, {
    String? where,
    List<Object?>? whereArgs,
  }) async {
    final db = await initializeDatabase();
    return await db.update(table, values, where: where, whereArgs: whereArgs);
  }

  Future<int> delete(
    String table, {
    String? where,
    List<Object?>? whereArgs,
  }) async {
    final db = await initializeDatabase();
    return await db.delete(table, where: where, whereArgs: whereArgs);
  }

  Future<void> close() async {
    final db = _database;
    if (db != null) {
      await db.close();
      _database = null;
    }
  }
}