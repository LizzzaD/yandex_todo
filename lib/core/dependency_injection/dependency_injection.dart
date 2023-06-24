import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

import '../../features/data/repositories/dio_remote_todo_repository_impl.dart';
import '../../features/data/repositories/sql_persistent_todo_repository_impl.dart';
import '../../features/domain/controllers/loader/loader_controller.dart';
import '../../features/domain/controllers/todo/todos_state.dart';
import '../../features/domain/repositories/persistent_todo_repository.dart';
import '../../features/domain/repositories/remote_todo_repository.dart';
import '../sql/sql.dart';

class DependencyInjection {
  DependencyInjection._();

  static Future<void> _injectCoreDependencies() async {
    final db = await SQL.database();
    GetIt.I.registerSingleton(db);

    final dio = Dio();
    GetIt.I.registerSingleton(dio);

    const uuid = Uuid();
    GetIt.I.registerSingleton<Uuid>(uuid);
  }

  static void _injectAppDependencies() {
    GetIt.I.registerSingleton(TodosState());

    GetIt.I.registerSingleton<PersistentTodoRepository>(
      SQLPersistentTodoRepositoryImpl(
        database: GetIt.I.get(),
      ),
    );

    GetIt.I.registerSingleton<RemoteTodoRepository>(
      DioRemoteTodoRepositoryImpl(
        dio: GetIt.I.get(),
      ),
    );

    GetIt.I.registerSingleton(LoaderController());
  }

  static Future<void> inject() async {
    await _injectCoreDependencies();
    _injectAppDependencies();
  }
}
