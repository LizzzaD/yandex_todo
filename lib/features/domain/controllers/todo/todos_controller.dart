import '../../../../core/utils/logger.dart';
import '../../models/todo/todo_model.dart';
import '../../repositories/persistent_todo_repository.dart';
import '../controller.dart';
import 'todos_state.dart';

class TodosController extends Controller {
  TodosController({
    required TodosState todosState,
    required PersistentTodoRepository persistentTodoRepository,
  })  : _todosState = todosState,
        _persistentTodoRepository = persistentTodoRepository;

  final TodosState _todosState;
  final PersistentTodoRepository _persistentTodoRepository;

  List<TodoModel> get todos =>
      _showDone ? _todosState.todos : _todosState.todos.where((e) => !e.isDone).toList();

  bool _showDone = true;

  bool get showDone => _showDone;

  int get todosIsDoneLength => _todosState.todos.where((e) => e.isDone).length;

  void switchShowDoneVisibility() {
    _showDone = !_showDone;
    notifyListeners();
  }

  Future<void> deleteTodo(String todoId) async {
    Logger.i(
      'TODO DELETED ${_todosState.todos.firstWhere((e) => e.id == todoId)}',
    );
    _todosState.todos.removeWhere((e) => e.id == todoId);
    await _persistentTodoRepository.deleteTodo(todoId);
    notifyListeners();
  }

  Future<void> switchTodoIsDone(String todoId) async {
    Logger.i('TODO  ${_todosState.todos.firstWhere((e) => e.id == todoId)}');
    final index = _todosState.todos.indexWhere((e) => e.id == todoId);
    _todosState.todos[index] = _todosState.todos[index].copyWith(
      isDone: !_todosState.todos[index].isDone,
    );
    await _persistentTodoRepository.updateTodo(_todosState.todos[index]);
    notifyListeners();
  }

  Future<void> init() async {
    final todosFromDb = await _persistentTodoRepository.getTodos();
    _todosState.todos = todosFromDb;
    notifyListeners();
  }
}
