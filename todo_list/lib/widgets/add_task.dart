import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/constants/colors.dart';
import 'package:todo_list/constants/text_styles.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/provider/task_list_provider.dart';

class AddTask extends ConsumerStatefulWidget {
  const AddTask({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _AddTask();
  }
}

class _AddTask extends ConsumerState<AddTask> {
  final _formKey = GlobalKey<FormState>();
  var _enteredTitle = '';
  var _enteredDescription = '';

  void _validateInput() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    } else {
      return;
    }

    ref.read(taskListProvider.notifier).addTask(Task(
        id: Random(1000).toString(),
        title: _enteredTitle,
        description: _enteredDescription,
        time: DateTime.now()));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty || value.length > 10) {
                      return 'Title must have 1-10 characters';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      _enteredTitle = value!;
                    });
                  },
                  decoration: const InputDecoration(
                    label: Text(
                      'Title',
                      style: textFieldTextStyle,
                    ),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty || value.length > 20) {
                      return 'Title must have 1-20 characters';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      _enteredDescription = value!;
                    });
                  },
                  decoration: const InputDecoration(
                    label: Text(
                      'Desription',
                      style: textFieldTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
              width: double.infinity,
              height: 50,
              child: TextButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(buttonColor)),
                  onPressed: () {
                    _validateInput();
                  },
                  child: const Text(
                    'Add Task',
                    style: normalTextStyle,
                  )))
        ],
      ),
    );
  }
}
