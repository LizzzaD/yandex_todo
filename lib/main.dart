import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'core/l10n/generated/l10n.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/logger.dart';
import 'features/domain/controllers/loader/loader_controller.dart';
import 'features/domain/controllers/todo/create_or_update_todo_controller.dart';
import 'features/domain/controllers/todo/todos_controller.dart';
import 'features/pages/splash/splash_page.dart';
import 'init.dart';

void main() {
  runZonedGuarded(
    () async {
      await initBefore();
      runApp(
        MultiProvider(
          providers: [
            ListenableProvider(
              create: (_) => TodosController(
                todosState: GetIt.I.get(),
                persistentTodoRepository: GetIt.I.get(),
              ),
            ),
            ListenableProvider(
              create: (_) => CreateOrUpdateTodoController(
                todosState: GetIt.I.get(),
                uuid: GetIt.I.get(),
                persistentTodoRepository: GetIt.I.get(),
              ),
            ),
            ListenableProvider(
              create: (_) => GetIt.I.get<LoaderController>(),
            ),
          ],
          child: const TodoApp(),
        ),
      );
    },
    (e, s) {
      Logger.e(e, s);
    },
  );
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashPage(),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      localizationsDelegates: const [
        L10n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L10n.delegate.supportedLocales,
      locale: const Locale('ru'),
    );
  }
}
