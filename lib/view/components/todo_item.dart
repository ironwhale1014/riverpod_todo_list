import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_filter_train/service/todo_list_service.dart';
import 'package:riverpod_filter_train/view/home.dart';

class TodoItem extends HookConsumerWidget {
  const TodoItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref.watch(currentTodo);

    final itemFocusNode = useFocusNode();
    final itemIsFocused = useIsFocused(itemFocusNode);

    final textEditController = useTextEditingController();
    final textFieldFocusNode = useFocusNode();

    return Material(
      color: Colors.white,
      elevation: 6,
      child: Focus(
        focusNode: itemFocusNode,
        onFocusChange: (hasFocus) {
          if (hasFocus) {
            textEditController.text = todo.description;
          } else {
            ref
                .read(todoListServiceProvider.notifier)
                .edit(id: todo.id, description: textEditController.text);
          }
        },
        child: ListTile(
          onTap: () {
            itemFocusNode.requestFocus();
            textFieldFocusNode.requestFocus();
          },
          leading: Checkbox(
            value: todo.completed,
            onChanged: (value) {
              ref.read(todoListServiceProvider.notifier).toggle(todo.id);
            },
          ),
          title:
              itemIsFocused
                  ? TextField(
                    autofocus: true,
                    focusNode: textFieldFocusNode,
                    controller: textEditController,
                  )
                  : Text(todo.description),
        ),
      ),
    );
  }
}

bool useIsFocused(FocusNode focusNode) {
  final isFocused = useState(focusNode.hasFocus);

  useEffect(() {
    void listener() {
      isFocused.value = focusNode.hasFocus;
    }

    focusNode.addListener(listener);

    return () => focusNode.removeListener(listener);
  }, [focusNode]);

  return isFocused.value;
}
