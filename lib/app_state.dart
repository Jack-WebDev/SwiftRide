import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uberscousin/views/Onboarding/lift_options.dart';
import 'package:uberscousin/views/Onboarding/login.dart';

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, spanshot) {
        if (spanshot.hasData) {
          return const LiftOptions();
        } else {
          return const LoginPage();
        }
      },
    ));
  }
}
