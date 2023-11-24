import 'package:flutter/material.dart';
import 'package:uberscousin/widgets/hamburger_menu.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      drawer: const Drawer(
        child: Menu(),
      ),
    );
  }
}