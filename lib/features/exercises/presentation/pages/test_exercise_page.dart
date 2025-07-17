import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/injection/service_locator.dart';
import '../../../../shared/utils/helpers.dart';
import '../../domain/entities/exercise.dart';
import '../../domain/usecases/get_exercises.dart';
import '../../domain/usecases/create_exercise.dart';
import '../../domain/usecases/get_exercise_tags.dart';

class TestExercisePage extends StatefulWidget {
  const TestExercisePage({super.key});

  @override
  State<TestExercisePage> createState() => _TestExercisePageState();
}

class _TestExercisePageState extends State<TestExercisePage> {
  List<Exercise> exercises = [];
  bool isLoading = false;
  String message = '';

  @override
  void initState() {
    super.initState();
    _loadExercises();
  }

  Future<void> _loadExercises() async {
    setState(() {
      isLoading = true;
      message = '';
    });

    final getExercises = sl<GetExercises>();
    final result = await getExercises();

    result.fold(
      (failure) {
        setState(() {
          message = 'Error: ${failure.message}';
          isLoading = false;
        });
      },
      (exerciseList) {
        setState(() {
          exercises = exerciseList;
          message = exerciseList.isEmpty 
              ? 'No hay ejercicios. Crea uno para probar.' 
              : 'Cargados ${exerciseList.length} ejercicios';
          isLoading = false;
        });
      },
    );
  }

  Future<void> _createTestExercise() async {
    setState(() {
      isLoading = true;
      message = 'Creando ejercicio de prueba...';
    });

    final createExercise = sl<CreateExercise>();
    final result = await createExercise(
      CreateExerciseParams(
        name: 'Flexiones de Prueba ${DateTime.now().millisecondsSinceEpoch}',
        description: 'Ejercicio de prueba creado para verificar la arquitectura',
        type: ExerciseType.bodyweight,
        muscleGroups: ['Pectorales', 'Tríceps'],
        tags: ['Prueba', 'Bodyweight'],
      ),
    );

    result.fold(
      (failure) {
        setState(() {
          message = 'Error al crear: ${failure.message}';
          isLoading = false;
        });
      },
      (exercise) {
        setState(() {
          message = 'Ejercicio creado: ${exercise.name}';
          isLoading = false;
        });
        _loadExercises(); // Recargar lista
      },
    );
  }

  Future<void> _loadTags() async {
    setState(() {
      isLoading = true;
      message = 'Cargando tags...';
    });

    final getTags = sl<GetExerciseTags>();
    final result = await getTags();

    result.fold(
      (failure) {
        setState(() {
          message = 'Error al cargar tags: ${failure.message}';
          isLoading = false;
        });
      },
      (tags) {
        setState(() {
          message = 'Tags cargados: ${tags.map((t) => t.name).join(', ')}';
          isLoading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba de Arquitectura'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Status message
            Container(
              padding: const EdgeInsets.all(AppSizes.paddingM),
              decoration: BoxDecoration(
                color: AppColors.darkGray,
                borderRadius: BorderRadius.circular(AppSizes.radiusM),
                border: Border.all(color: AppColors.mediumGray),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Estado del Sistema:',
                    style: AppTextStyles.headerSmall,
                  ),
                  const SizedBox(height: AppSizes.paddingS),
                  if (isLoading)
                    Row(
                      children: [
                        const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                        const SizedBox(width: AppSizes.paddingS),
                        Text(
                          'Cargando...',
                          style: AppTextStyles.bodyMedium,
                        ),
                      ],
                    )
                  else
                    Text(
                      message.isEmpty ? 'Listo para pruebas' : message,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: message.startsWith('Error') 
                            ? AppColors.error 
                            : AppColors.success,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: AppSizes.paddingL),

            // Action buttons
            Text(
              'Acciones de Prueba:',
              style: AppTextStyles.headerSmall,
            ),
            const SizedBox(height: AppSizes.paddingM),
            
            ElevatedButton.icon(
              onPressed: isLoading ? null : _loadExercises,
              icon: Icon(AppIcons.workout),
              label: const Text('Cargar Ejercicios'),
            ),
            const SizedBox(height: AppSizes.paddingM),
            
            ElevatedButton.icon(
              onPressed: isLoading ? null : _createTestExercise,
              icon: Icon(AppIcons.add),
              label: const Text('Crear Ejercicio de Prueba'),
            ),
            const SizedBox(height: AppSizes.paddingM),
            
            OutlinedButton.icon(
              onPressed: isLoading ? null : _loadTags,
              icon: Icon(AppIcons.filter),
              label: const Text('Cargar Tags'),
            ),
            const SizedBox(height: AppSizes.paddingL),

            // Exercise list
            if (exercises.isNotEmpty) ...[
              Text(
                'Ejercicios (${exercises.length}):',
                style: AppTextStyles.headerSmall,
              ),
              const SizedBox(height: AppSizes.paddingM),
              Expanded(
                child: ListView.separated(
                  itemCount: exercises.length,
                  separatorBuilder: (context, index) => 
                      const SizedBox(height: AppSizes.paddingS),
                  itemBuilder: (context, index) {
                    final exercise = exercises[index];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(AppSizes.paddingM),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  _getExerciseIcon(exercise.type),
                                  color: AppColors.exerciseGreen,
                                ),
                                const SizedBox(width: AppSizes.paddingS),
                                Expanded(
                                  child: Text(
                                    exercise.name,
                                    style: AppTextStyles.bodyLarge.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: AppSizes.paddingS),
                            Text(
                              exercise.description,
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.textMuted,
                              ),
                            ),
                            const SizedBox(height: AppSizes.paddingS),
                            Wrap(
                              spacing: AppSizes.paddingS,
                              children: exercise.muscleGroups.map((group) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppSizes.paddingS,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.exerciseGreen.withOpacity(0.1),
                                    border: Border.all(
                                      color: AppColors.exerciseGreen,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(AppSizes.radiusS),
                                  ),
                                  child: Text(
                                    group,
                                    style: AppTextStyles.bodySmall.copyWith(
                                      color: AppColors.exerciseGreen,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  IconData _getExerciseIcon(ExerciseType type) {
    switch (type) {
      case ExerciseType.weight:
        return AppIcons.weights;
      case ExerciseType.bodyweight:
        return AppIcons.bodyweight;
      case ExerciseType.time:
        return AppIcons.time;
      case ExerciseType.distance:
        return AppIcons.target;
    }
  }
}