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
      theme: ThemeData(primarySwatch: Colors.teal),
      initialRoute: AppRoutes.welcome,
      routes: AppRoutes.routes,
    );
  }
}
