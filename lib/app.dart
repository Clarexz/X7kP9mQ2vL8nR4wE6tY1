import 'package:flutter/material.dart';
import 'core/constants/app_constants.dart';
import 'features/exercises/presentation/pages/test_exercise_page.dart';

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: _buildTheme(),
      home: const TestExercisePage(), // ← CAMBIAR A LA PÁGINA DE PRUEBA
      debugShowCheckedModeBanner: false,
    );
  }

  ThemeData _buildTheme() {
    return ThemeData(
      // Configuración general
      useMaterial3: true,
      brightness: Brightness.dark,
      
      // Colores principales
      colorScheme: ColorScheme.dark(
        primary: AppColors.accentYellow,
        onPrimary: AppColors.primaryBlack,
        secondary: AppColors.exerciseGreen,
        onSecondary: AppColors.primaryBlack,
        surface: AppColors.primaryBlack,
        onSurface: AppColors.primaryWhite,
        error: AppColors.error,
        onError: AppColors.primaryWhite,
      ),
      
      // Scaffold
      scaffoldBackgroundColor: AppColors.primaryBlack,
      
      // AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryBlack,
        foregroundColor: AppColors.primaryWhite,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: AppTextStyles.headerMedium,
        iconTheme: const IconThemeData(
          color: AppColors.primaryWhite,
          size: AppSizes.iconL,
        ),
      ),
      
      // Cards
      cardTheme: CardThemeData(
        color: AppColors.darkGray,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusL),
          side: const BorderSide(
            color: AppColors.mediumGray,
            width: 1,
          ),
        ),
      ),
      
      // Botones
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accentYellow,
          foregroundColor: AppColors.primaryBlack,
          elevation: 0,
          minimumSize: const Size(double.infinity, AppSizes.buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusM),
          ),
          textStyle: AppTextStyles.bodyLarge.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryWhite,
          side: const BorderSide(color: AppColors.mediumGray),
          minimumSize: const Size(double.infinity, AppSizes.buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusM),
          ),
          textStyle: AppTextStyles.bodyLarge,
        ),
      ),
      
      // Input Fields
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkGray,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusM),
          borderSide: const BorderSide(color: AppColors.mediumGray),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusM),
          borderSide: const BorderSide(color: AppColors.mediumGray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusM),
          borderSide: const BorderSide(color: AppColors.accentYellow, width: 2),
        ),
        labelStyle: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.textMuted,
        ),
        hintStyle: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.textMuted,
        ),
        contentPadding: const EdgeInsets.all(AppSizes.paddingM),
      ),
      
      // Bottom Navigation
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.navigationPurple,
        selectedItemColor: AppColors.primaryWhite,
        unselectedItemColor: AppColors.primaryWhite.withOpacity(0.6),
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: AppTextStyles.bodySmall,
        unselectedLabelStyle: AppTextStyles.bodySmall,
      ),
      
      // Text Theme
      textTheme: TextTheme(
        headlineLarge: AppTextStyles.headerLarge,
        headlineMedium: AppTextStyles.headerMedium,
        headlineSmall: AppTextStyles.headerSmall,
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        bodySmall: AppTextStyles.bodySmall,
      ),
      
      // Icon Theme
      iconTheme: const IconThemeData(
        color: AppColors.primaryWhite,
        size: AppSizes.iconM,
      ),
    );
  }
}