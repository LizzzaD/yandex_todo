import 'package:dio/dio.dart';

import '../../domain/models/todo/todo_model.dart';
import '../../domain/repositories/remote_todo_repository.dart';

class DioRemoteTodoRepositoryImpl implements RemoteTodoRepository {
  DioRemoteTodoRepositoryImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<void> createTodo(TodoModel todo) async {
    _dio.get('');
  }

  @override
  Future<void> deleteTodo(String todoId) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<List<TodoModel>> getTodos() {
    // TODO: implement getTodos
    throw UnimplementedError();
  }

  @override
  Future<void> updateTodo(TodoModel todo) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }
}
