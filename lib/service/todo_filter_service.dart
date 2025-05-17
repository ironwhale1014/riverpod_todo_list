import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_filter_train/domain/todo.dart';
import 'package:riverpod_filter_train/service/todo_list_filter.dart';
import 'package:riverpod_filter_train/service/todo_list_service.dart';

part 'todo_filter_service.g.dart';

@riverpod
List<Todo> filteredTodos(Ref ref) {
  final List<Todo> todos = ref.watch(todoListServiceProvider);
  final TodoListFilter filter = ref.watch(todoListFilterNotifierProvider);

  switch (filter) {
    case TodoListFilter.all:
      return todos;
    case TodoListFilter.active:
      return todos.where((todo) => !todo.completed).toList();
    case TodoListFilter.completed:
      return todos.where((todo) => todo.completed).toList();
  }
}
