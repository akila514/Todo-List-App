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
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        foregroundColor: primaryTextColor,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      style: const TextStyle(color: primaryTextColor),
                      validator: (value) {
                        if (value!.isEmpty || value.length > 20) {
                          return 'Name must have 1-20 characters';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          enteredName = value!;
                        });
                      },
                      decoration: const InputDecoration(
                          label: Text(
                        'Enter name',
                        style: textFieldTextStyle,
                      )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      style: const TextStyle(color: primaryTextColor),
                      validator: (value) {
                        if (value!.isEmpty || value.length > 10) {
                          return 'Username must have 1-10 characters';
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
                          label: Text(
                        'Enter a Username',
                        style: textFieldTextStyle,
                      )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      style: const TextStyle(color: primaryTextColor),
                      validator: (value) {
                        if (value!.isEmpty || value.length > 10) {
                          return 'Password must have 1-8 characters';
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
                          label: Text(
                        'Enter a password',
                        style: textFieldTextStyle,
                      )),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: TextButton(
                        style: const ButtonStyle(
                            alignment: Alignment.center,
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
                          textAlign: TextAlign.center,
                        ),
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
