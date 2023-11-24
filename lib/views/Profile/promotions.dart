import 'package:flutter/material.dart';
import 'package:uberscousin/widgets/hamburger_menu.dart';

class Promotions extends StatelessWidget {
  const Promotions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Promotions"),
      ),
      body: const Text("Promotions"),
      drawer: const Drawer(
        child: Menu(),
      ),
    );
  }
}
