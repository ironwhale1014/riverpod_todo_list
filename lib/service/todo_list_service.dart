import 'package:riverpod_filter_train/domain/todo.dart';
import 'package:uuid/uuid.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_list_service.g.dart';

const _uuid = Uuid();

@riverpod
class TodoListService extends _$TodoListService {
  @override
  List<Todo> build() {
    return initialMemo;
  }

  void add(String description) {
    state = [...state, Todo(description: description, id: _uuid.v4())];
  }

  void toggle(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(
            id: todo.id,
            description: todo.description,
            completed: !todo.completed,
          )
        else
          todo,
    ];
  }

  void edit({required String id, required String description}) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(id: todo.id, description: description)
        else
          todo,
    ];
  }

  void remove(Todo target) {
    state = state.where((todo) => todo.id != target.id).toList();
  }
}
