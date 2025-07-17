import 'package:flutter/material.dart';
import 'app.dart';
import 'core/injection/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicializar dependencias
  await initializeDependencies();
  
  runApp(const FitnessApp());
}