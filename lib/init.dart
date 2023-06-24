import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/dependency_injection/dependency_injection.dart';
import 'core/utils/logger.dart';
import 'features/domain/controllers/todo/todos_controller.dart';

Future<void> initBefore() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (d) => Logger.e(d.exception, d.stack);

  PlatformDispatcher.instance.onError = (error, stack) {
    Logger.e(error, stack);
    return true;
  };

  await DependencyInjection.inject();
}

Future<void> initAfter(BuildContext context) async {
  await context.read<TodosController>().init();
}
