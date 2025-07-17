import 'dart:math';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

class Helpers {
  static const Uuid _uuid = Uuid();

  static String generateId() => _uuid.v4();

  static String formatWeight(double weight, {bool showUnit = true}) {
    if (weight == weight.toInt()) {
      return '${weight.toInt()}${showUnit ? 'kg' : ''}';
    } else {
      return '${weight.toStringAsFixed(1)}${showUnit ? 'kg' : ''}';
    }
  }

  static String formatReps(int reps) {
    return '$reps rep${reps > 1 ? 's' : ''}';
  }

  static String formatSets(int sets) {
    return '$sets set${sets > 1 ? 's' : ''}';
  }

  static Color lightenColor(Color color, double amount) {
    assert(amount >= 0 && amount <= 1, 'Amount must be between 0 and 1');
    final hsl = HSLColor.fromColor(color);
    final lightness = (hsl.lightness + amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }

  static Color darkenColor(Color color, double amount) {
    assert(amount >= 0 && amount <= 1, 'Amount must be between 0 and 1');
    final hsl = HSLColor.fromColor(color);
    final lightness = (hsl.lightness - amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }

  static String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return '¡Buenos días';
    } else if (hour < 18) {
      return '¡Buenas tardes';
    } else {
      return '¡Buenas noches';
    }
  }

  static double calculateOneRepMax(double weight, int reps) {
    if (reps == 1) return weight;
    // Epley formula: 1RM = weight × (1 + reps/30)
    return weight * (1 + reps / 30);
  }

  static int calculateWorkingWeight(double oneRepMax, double percentage) {
    return (oneRepMax * percentage / 100).round();
  }

  static String maskEmail(String email) {
    final parts = email.split('@');
    if (parts.length != 2) return email;
    
    final username = parts[0];
    final domain = parts[1];
    
    if (username.length <= 2) return email;
    
    final maskedUsername = '${username[0]}${'*' * (username.length - 2)}${username[username.length - 1]}';
    return '$maskedUsername@$domain';
  }

  static List<T> shuffleList<T>(List<T> list) {
    final random = Random();
    final newList = List<T>.from(list);
    for (int i = newList.length - 1; i > 0; i--) {
      final j = random.nextInt(i + 1);
      final temp = newList[i];
      newList[i] = newList[j];
      newList[j] = temp;
    }
    return newList;
  }
}