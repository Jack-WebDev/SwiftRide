import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future _resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text("Check your email!"),
          );
        },
      );
    } on FirebaseException catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reset Your Password"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text("Enter your email and we will send you a reset link"),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
              child: TextFormField(
                cursorColor: Colors.blue,
                controller: _emailController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your email',
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: _resetPassword,
              child: const Text(
                "RESET",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
