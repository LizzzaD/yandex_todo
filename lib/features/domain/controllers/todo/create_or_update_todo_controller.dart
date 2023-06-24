import 'package:uuid/uuid.dart';

import '../../../../core/constants/enums/todo_priority.dart';
import '../../models/todo/todo_model.dart';
import '../../repositories/persistent_todo_repository.dart';
import '../controller.dart';
import 'todos_state.dart';

class CreateOrUpdateTodoController extends Controller {
  CreateOrUpdateTodoController({
    required TodosState todosState,
    required Uuid uuid,
    required PersistentTodoRepository persistentTodoRepository,
  })  : _uuid = uuid,
        _todosState = todosState,
        _persistentTodoRepository = persistentTodoRepository;

  final TodosState _todosState;
  final Uuid _uuid;
  final PersistentTodoRepository _persistentTodoRepository;

  late TodoModel _todo;

  TodoModel get todo => _todo;

  void setText(String value) {
    _todo = _todo.copyWith(text: value);
  }

  void setDeadline(DateTime? value) {
    _todo = _todo.copyWith(deadline: value);
    notifyListeners();
  }

  void setPriority(TodoPriority value) {
    _todo = _todo.copyWith(priority: value);
    notifyListeners();
  }

  void setInitialTodo(TodoModel todo) {
    _todo = todo;
  }

  Future<void> createOrUpdate() async {
    if (_todo.id == null) {
      final newTodo = _todo.copyWith(id: _uuid.v4());
      _todosState.todos.add(newTodo);
      await _persistentTodoRepository.createTodo(newTodo);
    } else {
      final index = _todosState.todos.indexWhere((e) => e.id == _todo.id!);
      _todosState.todos[index] = _todo;
      await _persistentTodoRepository.updateTodo(_todo);
    }
  }
}
