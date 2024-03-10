import 'package:flutter/material.dart';

import '../../constants.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 24.0), // Spacer
                  // Logo
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(
                      'assets/images/workwise-logo.png',
                      width: 170.0,
                    ),
                  ),
                  const Text("Welcome back!",
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.w400)),
                  const SizedBox(height: 40.0),
                  // Email Field
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 24.0), // Spacer
                  // Password Field
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  const SizedBox(height: 8.0), // Spacer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          print('Forgot Password button pressed');
                        },
                        child: const Text('Forgot Password?',
                            style: TextStyle(color: AppColors.primaryColor)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24.0), // Spacer
                  // Sign In Button
                  ElevatedButton(
                    onPressed: () {
                      print("Sign in clicked");
                    },
                    child: const Text('Sign in'),
                  ),
                  const SizedBox(height: 24.0), // Spacer
                  // Sign Up Button
                  ElevatedButton(
                    onPressed: () {
                      print('Sign in With Google button pressed');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.primaryColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/google_logo.png',
                          width: 24.0,
                          height: 24.0,
                        ),
                        const SizedBox(width: 8.0), // Spacer
                        const Text('Sign in With Google'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24.0), // Spacer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don’t have an account?"),
                      TextButton(
                        onPressed: () {
                          print('Sign Up button pressed');
                        },
                        child: const Text('Sign Up',
                            style: TextStyle(color: AppColors.primaryColor)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0), // Spacer
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
