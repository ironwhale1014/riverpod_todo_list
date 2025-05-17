import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_filter_train/service/todo_list_service.dart';

part 'uncompleted_todos_count_provider.g.dart';

@riverpod
int uncompletedCount(Ref ref) {
  return ref
      .watch(todoListServiceProvider)
      .where((todo) => !todo.completed)
      .length;
}
