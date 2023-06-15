
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/features/controllers/tasks_controller.dart';
import 'package:todo/features/screens/main_screen.dart';
import 'package:todo/features/screens/task_screen.dart';

import 'core/theme/app_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TasksController()),],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.getLightTheme,
      darkTheme: AppTheme.getDarkTheme,
      title: 'Flutter Demo',
      home: const MainScreen(),
    );
  }
}
