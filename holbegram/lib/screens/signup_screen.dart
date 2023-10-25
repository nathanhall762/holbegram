import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextEditingController passwordConfirmController;
  final bool passwordVisible;

  SignUp({
    required this.emailController,
    required this.usernameController,
    required this.passwordController,
    required this.passwordConfirmController,
    this.passwordVisible = true,
  });

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  void initState() {
    super.initState();
    widget.passwordVisible;
  }

  @override
  void dispose() {
    widget.emailController.dispose();
    widget.usernameController.dispose();
    widget.passwordController.dispose();
    widget.passwordConfirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'), // Add an app bar title
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Your other widgets go here...

            const SizedBox(height: 24),

            // TextButton widget
            TextButton(
              onPressed: () {
                // Handle the TextButton press (e.g., navigate to another page).
              },
              child: Text(
                "Already have an account? Log in",
                style: TextStyle(
                  color: Color.fromARGB(218, 226, 37, 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}