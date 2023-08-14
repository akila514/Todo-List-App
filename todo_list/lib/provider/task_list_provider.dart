import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/models/task.dart';

class TaskListNotifier extends StateNotifier<List<Task>> {
  TaskListNotifier() : super([]);

  void addTask(Task task) {
    state = [...state, task];
  }

  void deleteTask(Task task) {
    state = state.where((t) => task.id != t.id).toList();
  }

  void replceUserList(List<Task> taksList) {
    state = taksList;
  }
}

final taskListProvider = StateNotifierProvider<TaskListNotifier, List<Task>>(
    (ref) => TaskListNotifier());
