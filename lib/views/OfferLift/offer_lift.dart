import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uberscousin/views/OfferLift/activity.dart';
import 'package:uberscousin/views/OfferLift/home_page.dart';
import 'package:uberscousin/views/Profile/profile_home.dart';

class OfferLift extends StatefulWidget {
  const OfferLift({super.key});

  @override
  State<OfferLift> createState() => _OfferLiftState();
}

class _OfferLiftState extends State<OfferLift> {
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
