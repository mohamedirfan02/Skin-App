import 'package:flutter/material.dart';
import 'package:skin_app/routing/router.dart';

class SkinApp extends StatefulWidget {
  const SkinApp({super.key});

  @override
  State<SkinApp> createState() => _SkinAppState();
}

class _SkinAppState extends State<SkinApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
