import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:google_fonts/google_fonts.dart';
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'TaskTrack',
                // style: GoogleFonts.comfortaa(
                //   textStyle: const TextStyle(
                //       fontSize: 40,
                //       fontWeight: FontWeight.bold,
                //       color: primaryTextColor),
                // ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: const BoxDecoration(color: Color(0XFF34495e)),
                width: double.infinity,
                height: 300,
                child: Image.asset(
                  'assets/images/image1.jpg',
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Hello!',
                      style: largeTextStyle.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 32),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Manage your personal and work life with TaskTrack',
                      style:
                          smallTextStyle.copyWith(fontWeight: FontWeight.w200),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 300,
                height: 60,
                child: TextButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(buttonColor),
                  ),
                  onPressed: () {
                    _navigateToLoginScreen(context);
                  },
                  child: const Text(
                    'Login',
                    style: normalTextStyle,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 300,
                height: 60,
                child: TextButton(
                  onPressed: () {
                    navigateToSignupSceen(context);
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color(0XFF34495e),
                    ),
                  ),
                  child: const Text(
                    'Signup',
                    style: normalTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
