class Validators {
  static String? validateExerciseName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'El nombre del ejercicio es obligatorio';
    }
    if (value.trim().length < 2) {
      return 'El nombre debe tener al menos 2 caracteres';
    }
    if (value.trim().length > 100) {
      return 'El nombre no puede exceder 100 caracteres';
    }
    return null;
  }

  static String? validateRoutineName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'El nombre de la rutina es obligatorio';
    }
    if (value.trim().length < 2) {
      return 'El nombre debe tener al menos 2 caracteres';
    }
    if (value.trim().length > 100) {
      return 'El nombre no puede exceder 100 caracteres';
    }
    return null;
  }

  static String? validateWeight(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null; // Weight is optional
    }
    final weight = double.tryParse(value);
    if (weight == null) {
      return 'Peso inválido';
    }
    if (weight < 0) {
      return 'El peso no puede ser negativo';
    }
    if (weight > 1000) {
      return 'El peso no puede exceder 1000kg';
    }
    return null;
  }

  static String? validateReps(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null; // Reps are optional
    }
    final reps = int.tryParse(value);
    if (reps == null) {
      return 'Repeticiones inválidas';
    }
    if (reps < 1) {
      return 'Las repeticiones deben ser al menos 1';
    }
    if (reps > 999) {
      return 'Las repeticiones no pueden exceder 999';
    }
    return null;
  }

  static String? validateSets(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'El número de sets es obligatorio';
    }
    final sets = int.tryParse(value);
    if (sets == null) {
      return 'Número de sets inválido';
    }
    if (sets < 1) {
      return 'Debe haber al menos 1 set';
    }
    if (sets > 20) {
      return 'No pueden haber más de 20 sets';
    }
    return null;
  }

  static String? validateDuration(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null; // Duration is optional
    }
    final duration = int.tryParse(value);
    if (duration == null) {
      return 'Duración inválida';
    }
    if (duration < 1) {
      return 'La duración debe ser al menos 1 segundo';
    }
    if (duration > 7200) { // 2 hours max
      return 'La duración no puede exceder 2 horas';
    }
    return null;
  }

  static String? validateUserName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'El nombre es obligatorio';
    }
    if (value.trim().length < 2) {
      return 'El nombre debe tener al menos 2 caracteres';
    }
    if (value.trim().length > 50) {
      return 'El nombre no puede exceder 50 caracteres';
    }
    return null;
  }
}