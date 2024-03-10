import 'package:flutter/material.dart';
import 'package:flutter_app/theme/colors.dart';
import 'package:flutter_app/views/auth/sign_in_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo
              Container(
                margin: const EdgeInsets.only(bottom: 0.0),
                child: Image.asset(
                  'assets/images/workwise-logo.png',
                  width: 240.0,
                ),
              ),
              const SizedBox(height: 8.0), // Spacer
              const Text("Welcome to WorkWise",
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500)),
              const SizedBox(height: 4.0), // Spacer
              const Text("Your ultimate job search companion!",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
                      color: WorkWiseColor.darkGreyColor)),
              const SizedBox(height: 60.0), // Spacer
              // Sign In Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignInView()),
                  );
                },
                child: const Text('Sign In'),
              ),
              const SizedBox(height: 32.0), // Spacer
              // Sign Up Button
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignInView()),
                  );
                },
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
