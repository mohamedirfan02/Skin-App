import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';  // Import splash package
import 'app.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures Flutter is initialized properly

  // Boolean flag to control whether splash screen should run or not
  bool showSplashScreen = false;

  // Conditionally preserve the splash screen
  if (showSplashScreen) {
    FlutterNativeSplash.preserve(widgetsBinding: WidgetsFlutterBinding.ensureInitialized());
  }

  // Perform your initialization (e.g., waiting for 2 seconds)
  // await initialization(null);

  // Run the app after the initialization
  runApp(const ProviderScope(child: SkinApp()));

  // Conditionally remove the splash screen after initialization
  if (showSplashScreen) {
    FlutterNativeSplash.remove();
  }
}

// Initialization function with a delay (2 seconds)
Future initialization(BuildContext? context) async {
   Future.delayed(Duration(seconds: 1));
}
