import 'package:hive/hive.dart';
import 'package:notes_sphere/models/todo_model.dart';

class TodoService {
  List<TodoModel> todosList = [
    TodoModel(
      title: "Read a Book",
      date: DateTime.now(),
      time: DateTime.now(),
      isComplete: false,
    ),
    TodoModel(
      title: "Go for a Walk",
      date: DateTime.now(),
      time: DateTime.now(),
      isComplete: false,
    ),
    TodoModel(
      title: "Complete Assignment",
      date: DateTime.now(),
      time: DateTime.now(),
      isComplete: false,
    ),
  ];

  //create instance to todo box
  final _todoBox = Hive.box('todos');

  //check is user new?
  Future<bool> isUserNew() async {
    return _todoBox.isEmpty;
  }

  //save initial todos if user is new user
  Future<void> saveInitialTodos() async {
    try {
      if (_todoBox.isEmpty) {
        await _todoBox.put("todos", todosList);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //fetch initial todos
  Future<List<TodoModel>> fetchInitialTodos() async {
    final dynamic allTodos = await _todoBox.get("todos");
    if (allTodos != null && allTodos is List<dynamic>) {
      return allTodos.cast<TodoModel>().toList();
    }
    return [];
  }

  //marck as done

  Future<void> updateTodo(TodoModel todoIndex) async {
    try {
      final dynamic allTodos = await _todoBox.get("todos");
      final int index = allTodos.indexWhere(
        (element) => element.id == todoIndex.id,
      );
      allTodos[index] = todoIndex;
      await _todoBox.put("todos", allTodos);
    } catch (e) {
      print(e.toString());
    }
  }
}
