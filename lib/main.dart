import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/features/controllers/tasks_controller.dart';
import 'package:todo/features/screens/main_screen.dart';

import 'core/theme/app_theme.dart';
import 'core/utils/logger.dart';

void main() {
  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();

      FlutterError.onError = (d) => Logger.l('', d.exception, d.stack);

      PlatformDispatcher.instance.onError = (error, stack) {
        Logger.l('', error, stack);
        return true;
      };

      runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => TasksController()),
          ],
          child: const MyApp(),
        ),
      );
    },
    (e, s) {
      Logger.l(e, s);
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.getLightTheme,
      darkTheme: AppTheme.getDarkTheme,
      home: const MainScreen(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ru'),
        Locale('en'),
      ],
      locale: const Locale('ru'),
    );
  }
}
