import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/constants/colors.dart';
import 'package:todo_list/constants/text_styles.dart';
import 'package:todo_list/widgets/add_task.dart';
import 'package:todo_list/widgets/task_list.dart';

class Tabs extends ConsumerStatefulWidget {
  const Tabs({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _Tabs();
  }
}

class _Tabs extends ConsumerState<Tabs> {
  var currentIndex = 0;
  var activeTitle = 'My Tasks';

  void _changeTab(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = const TaskList();

    if (currentIndex == 0) {
      setState(() {
        activeScreen = const TaskList();
        activeTitle = 'My Tasks';
      });
    }

    if (currentIndex == 1) {
      setState(() {
        activeScreen = const AddTask();
        activeTitle = 'Add Task';
      });
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: primaryTextColor,
        backgroundColor: backgroundColor,
        title: Text(activeTitle),
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: _changeTab,
        backgroundColor: backgroundColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.task,
              color: primaryTextColor,
            ),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_task,
              color: primaryTextColor,
            ),
            label: 'Add Task',
          ),
        ],
        unselectedItemColor: primaryTextColor,
        selectedItemColor: const Color.fromARGB(255, 41, 121, 146),
      ),
    );
  }
}
