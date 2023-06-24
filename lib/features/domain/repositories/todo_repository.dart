import '../models/todo/todo_model.dart';

abstract class TodoRepository {
  Future<void> createTodo(TodoModel todo);

  Future<List<TodoModel>> getTodos();

  Future<void> updateTodo(TodoModel todo);

  Future<void> deleteTodo(String todoId);
}
