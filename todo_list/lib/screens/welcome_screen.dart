import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/constants/colors.dart';
import 'package:todo_list/constants/text_styles.dart';
import 'package:todo_list/screens/login_screen.dart';
import 'package:todo_list/screens/signup_screen.dart';

class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _WelcomeScreen();
  }
}

void navigateToSignupSceen(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const SignUpScreen(),
    ),
  );
}

class _WelcomeScreen extends ConsumerState<WelcomeScreen> {
  void _navigateToLoginScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Todo',
              style: largeTextStyle.copyWith(fontSize: 40),
            ),
            const SizedBox(
              height: 40,
            ),
            Image.asset(
              'assets/images/image1.jpg',
              width: double.infinity,
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Welcome to Todo',
              style: largeTextStyle,
            ),
            const SizedBox(
              height: 40,
            ),
            TextButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(buttonColor),
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10))),
              onPressed: () {
                _navigateToLoginScreen(context);
              },
              child: const Text(
                'Login',
                style: normalTextStyle,
              ),
            ),
            TextButton(
              onPressed: () {
                navigateToSignupSceen(context);
              },
              child: const Text(
                'Signup',
                style: normalTextStyle,
              ),
            ),
          ],
        ));
  }
}
