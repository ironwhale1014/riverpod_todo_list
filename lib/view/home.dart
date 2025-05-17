import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_filter_train/common/layout/defualt_layout.dart';
import 'package:riverpod_filter_train/domain/todo.dart';
import 'package:riverpod_filter_train/service/todo_filter_service.dart';
import 'package:riverpod_filter_train/service/todo_list_service.dart';
import 'package:riverpod_filter_train/view/components/todo_item.dart';
import 'package:riverpod_filter_train/view/components/toolbar.dart';

final addTodoKey = UniqueKey();
final currentTodo = Provider<Todo>(
  dependencies: [],
  (ref) => throw UnimplementedError(),
);

class Home extends ConsumerWidget {
  Home({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(filteredTodosProvider);

    return DefaultLayout(
      title: 'Riverpod Train',
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        children: [
          TextFormField(
            // key: addTodoKey,
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'What needs to be done',
            ),
            onFieldSubmitted: (value) {
              ref.read(todoListServiceProvider.notifier).add(value);
              _controller.clear();
            },
          ),
          const SizedBox(height: 42),
          Toolbar(),
          if (todos.isNotEmpty) Divider(height: 0),
          for (var i = 0; i < todos.length; i++) ...[
            if (i > 0) const Divider(height: 0),
            Dismissible(
              key: ValueKey(todos[i].id),
              onDismissed: (_) {
                ref.read(todoListServiceProvider.notifier).remove(todos[i]);
              },
              child: ProviderScope(
                overrides: [currentTodo.overrideWithValue(todos[i])],
                child: TodoItem(),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
