import 'package:flutter/material.dart';
import 'routes.dart';

void main() {
  runApp(const SkillFinderApp());
}

class SkillFinderApp extends StatelessWidget {
  const SkillFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skill Finder Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.white,
      ),

      // ✅ Start from the welcome screen
      initialRoute: AppRoutes.welcome,

      // ✅ Register static routes
      routes: AppRoutes.routes,

      // ✅ Handle routes that pass arguments (like categoryName)
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
