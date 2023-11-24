import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ManageAccount extends StatefulWidget {
  const ManageAccount({super.key});

  @override
  State<ManageAccount> createState() => _ManageAccountState();
}

class _ManageAccountState extends State<ManageAccount> {
    int _selectedIndex = 0;

  void _navigator(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Center(
            child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF73AEF5),
                Color(0xFF61A4F1),
                Color(0xFF478DE0),
                Color(0xFF398AE5),
              ],
              stops: [0.1, 0.4, 0.7, 0.9],
            ),
          ),
          child: const Text("rgd"),
        )),
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.blue[700],
          currentIndex: _selectedIndex,
          onTap: _navigator,
          selectedFontSize: 20,
          selectedItemColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: "Your Activity",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Account",
            )
          ]),
    );
  }
}
