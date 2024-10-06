import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart' as sd;

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: const sd.ShadCard(
          width: 350,
          title: Text('Sign in'),
          description: Text(
              "Sign in to your account please enter your email and password"),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Email"),
                SizedBox(height: 10),
                sd.ShadInput(placeholder: Text("Insert your email")),
                SizedBox(height: 20),
                Text("Password"),
                SizedBox(height: 10),
                sd.ShadInput(placeholder: Text("Insert your password")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUp extends StatelessWidget {

  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}
