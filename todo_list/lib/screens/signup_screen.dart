import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/models/user.dart';
import 'package:todo_list/provider/user_provider.dart';

import '../constants/colors.dart';
import '../constants/text_styles.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  var enteredName = '';
  var enteredUsername = '';
  var enteredPassword = '';

  void _validateInput() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    } else {
      return;
    }

    ref.read(userProvider.notifier).addUser(
          User(
              id: Random(1000).toString(),
              name: enteredName,
              username: enteredUsername,
              password: enteredPassword),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUp'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty || value.length > 20) {
                          return 'Username must have 1-20 characters';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          enteredName = value!;
                        });
                      },
                      decoration:
                          const InputDecoration(label: Text('Enter name')),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty || value.length > 20) {
                          return 'Username must have 1-20 characters';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          enteredUsername = value!;
                        });
                      },
                      decoration: const InputDecoration(
                          label: Text('Enter a Username')),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty || value.length > 20) {
                          return 'Username must have 1-20 characters';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          enteredPassword = value!;
                        });
                      },
                      decoration: const InputDecoration(
                          label: Text('Enter a password')),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextButton(
                      style: const ButtonStyle(
                          alignment: Alignment.centerLeft,
                          backgroundColor:
                              MaterialStatePropertyAll(buttonColor),
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10))),
                      onPressed: () {
                        _validateInput();
                      },
                      child: const Text(
                        'SignUp',
                        style: normalTextStyle,
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
