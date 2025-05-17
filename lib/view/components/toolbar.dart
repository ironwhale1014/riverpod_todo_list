import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_filter_train/service/todo_list_filter.dart';

import '../../common/util/logger.dart';
import '../../service/uncompleted_todos_count_provider.dart';

class Toolbar extends ConsumerWidget {
  const Toolbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TodoListFilter filter = ref.watch(todoListFilterNotifierProvider);

    Color? textColorFor(TodoListFilter value) {
      return filter == value ? Colors.white : Colors.black;
    }

    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              overflow: TextOverflow.ellipsis,
              '${ref.watch(uncompletedCountProvider)} items left',
            ),
          ),
          Tooltip(
            message: 'All Todos',
            child: TextButton(
              style: ButtonStyle(
                visualDensity: VisualDensity.compact,
                foregroundColor: WidgetStatePropertyAll(
                  textColorFor(TodoListFilter.all),
                ),
              ),
              onPressed:
                  () => ref
                      .read(todoListFilterNotifierProvider.notifier)
                      .setFilter(TodoListFilter.all),
              child: Text("All"),
            ),
          ),
          Tooltip(
            message: 'Only uncompleted todos',
            child: TextButton(
              style: ButtonStyle(
                visualDensity: VisualDensity.compact,
                foregroundColor: WidgetStatePropertyAll(
                  textColorFor(TodoListFilter.active),
                ),
              ),
              onPressed:
                  () => ref
                      .read(todoListFilterNotifierProvider.notifier)
                      .setFilter(TodoListFilter.active),
              child: Text("Active"),
            ),
          ),
          Tooltip(
            message: 'Only completed todos',
            child: TextButton(
              style: ButtonStyle(
                visualDensity: VisualDensity.compact,
                foregroundColor: WidgetStatePropertyAll(
                  textColorFor(TodoListFilter.completed),
                ),
              ),
              onPressed:
                  () => ref
                      .read(todoListFilterNotifierProvider.notifier)
                      .setFilter(TodoListFilter.completed),
              child: Text("Completed"),
            ),
          ),
        ],
      ),
    );
  }
}
