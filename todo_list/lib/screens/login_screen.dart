import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/provider/user_provider.dart';

import '../constants/colors.dart';
import '../constants/text_styles.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  var enteredUsername = '';
  var enteredPassword = '';
  final _formKey = GlobalKey<FormState>();

  void _validateCredentials() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    } else {
      return;
    }
    for (final user in ref.read(userProvider)) {
      if (user.username == enteredUsername &&
          user.password == enteredPassword) {
        print('Success');
        return;
      }
    }
    print('failed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
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
                        enteredUsername = value!;
                      });
                    },
                    decoration:
                        const InputDecoration(label: Text('Enter a Username')),
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
                    decoration:
                        const InputDecoration(label: Text('Enter a password')),
                  ),
                ],
              ),
            ),
            TextButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(buttonColor),
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10))),
              onPressed: () {
                _validateCredentials();
              },
              child: const Text(
                'Login',
                style: normalTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
