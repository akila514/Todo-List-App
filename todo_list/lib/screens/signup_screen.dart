import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/colors.dart';
import '../constants/text_styles.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  void _validateInput() {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey();

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
                      decoration:
                          const InputDecoration(label: Text('Enter name')),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      onSaved: (value) {

                      },
                      decoration: const InputDecoration(
                          label: Text('Enter a Username')),
                    ),
                    TextFormField(
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
