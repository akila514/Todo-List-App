import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/constants/text_styles.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/provider/task_list_provider.dart';

class TaskList extends ConsumerStatefulWidget {
  const TaskList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _TaskListState();
  }
}

class _TaskListState extends ConsumerState<TaskList> {
  @override
  Widget build(BuildContext context) {
    List<Task> taskList = ref.watch(taskListProvider);

    return ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) => Container(
                child: Text(
              taskList[index].title,
              style: normalTextStyle,
            )));
  }
}
