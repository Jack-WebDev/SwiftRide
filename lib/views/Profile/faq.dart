import 'package:flutter/material.dart';
import 'package:uberscousin/widgets/hamburger_menu.dart';

class FAQ extends StatelessWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FAQ Page"),
      ),
      body: const Text("FAQ"),
      drawer: const Drawer(
        child: Menu(),
      ),
    );
  }
}
