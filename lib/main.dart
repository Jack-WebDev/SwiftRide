import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uberscousin/app_state.dart';
import 'package:uberscousin/firebase_options.dart';
// import 'app_state.dart';r

// void main() => runApp(const MyApp());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swift Ride App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Colors.white,
            selectionHandleColor: Colors.blue,
          )),
      home: const EntryPage(title: 'SwiftRide'),
    );
  }
}

class EntryPage extends StatelessWidget {
  final String title;
  const EntryPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AppState(),
    );
  }
}
