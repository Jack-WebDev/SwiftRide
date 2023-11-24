import 'package:flutter/material.dart';
import 'package:uberscousin/widgets/hamburger_menu.dart';

class RequestHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Page'),
      ),
      body: ListView(
        children: const <Widget>[
          ListTile(
            title: Text("Client"),
            subtitle: Text("R400"),
          ),
        ],
      ),
      drawer: const Drawer(
        child: Menu(),
      ),
    );
  }
}
