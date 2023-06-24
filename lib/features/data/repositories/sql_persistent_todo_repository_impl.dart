import 'package:sqflite/sqflite.dart';

import '../../../core/sql/sql_tables.dart';
import '../../domain/models/todo/todo_model.dart';
import '../../domain/repositories/persistent_todo_repository.dart';

class SQLPersistentTodoRepositoryImpl implements PersistentTodoRepository {
  SQLPersistentTodoRepositoryImpl({required Database database}) : _db = database;

  final Database _db;

  @override
  Future<void> createTodo(TodoModel todo) async {
    await _db.insert(SQLTables.todosTable, todo.toJson());
  }

  @override
  Future<void> deleteTodo(String todoId) async {
    await _db.delete(SQLTables.todosTable, where: 'id = ?', whereArgs: [todoId]);
  }

  @override
  Future<List<TodoModel>> getTodos() async {
    final todosRaw = await _db.query(SQLTables.todosTable);

    return todosRaw.map((e) => TodoModel.fromJson(e)).toList();
  }

  @override
  Future<void> updateTodo(TodoModel todo) async {
    _db.update(SQLTables.todosTable, todo.toJson(), where: 'id = ?', whereArgs: [todo.id]);
  }
}
