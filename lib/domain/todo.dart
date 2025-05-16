class Todo {
  Todo({required this.description, required this.id, this.completed = false});

  final String description;
  final String id;
  final bool completed;

  @override
  String toString() {
    return 'Todo(description: $description, id: $id, completed: $completed)';
  }
}

List<Todo> initialMemo = [
  Todo(id: 'todo-0', description: 'Buy cookies'),
  Todo(id: 'todo-1', description: 'Star Riverpod'),
  Todo(id: 'todo-2', description: 'Have a walk'),
];
