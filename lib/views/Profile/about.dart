import 'package:flutter/material.dart';
import 'package:uberscousin/widgets/hamburger_menu.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Page"),
      ),
      body: const Text("About"),
      drawer: const Drawer(
        child: Menu(),
      ),
    );
  }
}
