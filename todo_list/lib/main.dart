import 'package:flutter/material.dart';
import 'package:todo_list/screens/login_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(useMaterial3: true),
    home: const App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginScreen();
  }
}
