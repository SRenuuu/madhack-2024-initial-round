import 'package:flutter/material.dart';
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
            children: [
              // Logo
              Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                child: Image.asset(
                  'assets/images/workwise-logo.png',
                  width: 240.0,
                ),
              ),
              const SizedBox(height: 64.0), // Spacer
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
              const SizedBox(height: 24.0), // Spacer
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
