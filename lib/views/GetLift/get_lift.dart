import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uberscousin/views/Profile/profile_home.dart';
import 'package:uberscousin/views/GetLift/activities.dart';
import 'package:uberscousin/views/GetLift/home_page.dart';

class GetLift extends StatefulWidget {
  const GetLift({super.key});

  @override
  State<GetLift> createState() => _GetLiftState();
}

class _GetLiftState extends State<GetLift> {
  final user = FirebaseAuth.instance.currentUser!;
  int _selectedIndex = 0;

  void _navigator(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const HomePage(),
    const Activities(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
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
