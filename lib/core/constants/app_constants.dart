// lib/core/constants/app_constants.dart
import 'package:flutter/material.dart';

class AppConstants {
  // Información de la app
  static const String appName = 'Fitness App';
  static const String appVersion = '1.0.0';
  
  // Base de datos
  static const String databaseName = 'fitness_app.db';
  static const int databaseVersion = 1;
  
  // Configuraciones de entrenamiento
  static const int defaultRestTime = 60; // segundos
  static const int defaultCountdown = 10; // segundos
  static const int maxExercisesPerRoutine = 20;
  static const int maxSetsPerExercise = 10;
  
  // Animaciones
  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);
  static const Duration fastAnimationDuration = Duration(milliseconds: 150);
  static const Duration slowAnimationDuration = Duration(milliseconds: 500);
}

class AppColors {
  // Paleta principal según diseño
  static const Color primaryBlack = Color(0xFF1A1A1A);      // Fondo principal
  static const Color exerciseGreen = Color(0xFF4ECDC4);     // Verde/Aqua ejercicios
  static const Color accentYellow = Color(0xFFE6FF4D);      // Amarillo/Lima destacados
  static const Color routineRed = Color(0xFFFF6B6B);        // Rojo/Coral rutinas
  static const Color primaryWhite = Color(0xFFFFFFFF);      // Texto principal
  static const Color navigationPurple = Color(0xFF6C5CE7);  // Púrpura navegación
  
  // Colores secundarios
  static const Color darkGray = Color(0xFF2A2A2A);          // Backgrounds secundarios
  static const Color mediumGray = Color(0xFF333333);        // Borders y separadores
  static const Color lightGray = Color(0xFF666666);         // Texto secundario
  static const Color textMuted = Color(0xFF999999);         // Texto deshabilitado
  
  // Tags de grupos musculares (colores personalizables)
  static const Color tagPectorales = Color(0xFFFF6B6B);     // Rojo
  static const Color tagTriceps = Color(0xFFFFCE54);        // Amarillo/Naranja
  static const Color tagDeltoides = Color(0xFF4ECDC4);      // Verde/Aqua
  static const Color tagLaterales = Color(0xFFABEBC6);      // Verde claro
  static const Color tagBiceps = Color(0xFFA29BFE);         // Púrpura claro
  static const Color tagTrapecios = Color(0xFFDDD6FE);      // Púrpura muy claro
  static const Color tagPiernas = Color(0xFFFF9FF3);        // Rosa
  static const Color tagEspalda = Color(0xFF6C5CE7);        // Púrpura oscuro
  
  // Estados y feedback
  static const Color success = Color(0xFF10B981);           // Verde éxito
  static const Color warning = Color(0xFFF59E0B);           // Amarillo advertencia  
  static const Color error = Color(0xFFEF4444);             // Rojo error
  static const Color info = Color(0xFF3B82F6);              // Azul información
  
  // Transparencias útiles
  static Color blackOverlay = primaryBlack.withOpacity(0.7);
  static Color whiteOverlay = primaryWhite.withOpacity(0.1);
  static Color accentOverlay = accentYellow.withOpacity(0.1);
}

class AppTextStyles {
  // Títulos
  static const TextStyle headerLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryWhite,
  );
  
  static const TextStyle headerMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryWhite,
  );
  
  static const TextStyle headerSmall = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryWhite,
  );
  
  // Cuerpo de texto
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryWhite,
  );
  
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryWhite,
  );
  
  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
  );
  
  // Especiales
  static const TextStyle accent = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.accentYellow,
  );
  
  static const TextStyle countdown = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryWhite,
  );
  
  static const TextStyle exerciseTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.exerciseGreen,
  );
  
  static const TextStyle routineTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.routineRed,
  );
}

class AppSizes {
  // Espaciado
  static const double paddingXS = 4.0;
  static const double paddingS = 8.0;
  static const double paddingM = 16.0;
  static const double paddingL = 20.0;
  static const double paddingXL = 24.0;
  static const double paddingXXL = 32.0;
  
  // Border radius
  static const double radiusS = 8.0;
  static const double radiusM = 12.0;
  static const double radiusL = 16.0;
  static const double radiusXL = 20.0;
  static const double radiusRound = 50.0;
  
  // Tamaños de iconos
  static const double iconS = 16.0;
  static const double iconM = 20.0;
  static const double iconL = 24.0;
  static const double iconXL = 32.0;
  
  // Alturas de componentes
  static const double buttonHeight = 48.0;
  static const double inputHeight = 56.0;
  static const double cardMinHeight = 80.0;
  static const double bottomNavHeight = 80.0;
}

class AppIcons {
  // Navegación principal
  static const IconData home = Icons.home;
  static const IconData workout = Icons.fitness_center;
  static const IconData profile = Icons.person;
  
  // Acciones principales
  static const IconData add = Icons.add;
  static const IconData search = Icons.search;
  static const IconData filter = Icons.filter_list;
  static const IconData edit = Icons.edit;
  static const IconData delete = Icons.delete;
  static const IconData settings = Icons.settings;
  
  // Entrenamiento
  static const IconData play = Icons.play_arrow;
  static const IconData pause = Icons.pause;
  static const IconData stop = Icons.stop;
  static const IconData timer = Icons.timer;
  static const IconData target = Icons.track_changes;
  static const IconData progress = Icons.trending_up;
  
  // Estados y feedback
  static const IconData checkCircle = Icons.check_circle;
  static const IconData xCircle = Icons.cancel;
  static const IconData alertCircle = Icons.warning;
  static const IconData info = Icons.info;
  
  // Tipos de vista
  static const IconData gridView = Icons.grid_view;
  static const IconData listView = Icons.view_list;
  static const IconData compactView = Icons.view_compact;
  
  // Datos y métricas
  static const IconData chart = Icons.bar_chart;
  static const IconData calendar = Icons.calendar_today;
  static const IconData clock = Icons.access_time;
  static const IconData weight = Icons.scale;
  
  // Ejercicios específicos
  static const IconData bodyweight = Icons.accessibility;
  static const IconData weights = Icons.fitness_center;
  static const IconData cardio = Icons.favorite;
  static const IconData time = Icons.schedule;
  
  // Navegación y UI
  static const IconData back = Icons.arrow_back;
  static const IconData forward = Icons.arrow_forward;
  static const IconData close = Icons.close;
  static const IconData menu = Icons.menu;
  static const IconData moreVert = Icons.more_vert;
}