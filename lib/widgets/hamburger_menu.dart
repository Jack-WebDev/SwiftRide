import 'package:flutter/material.dart';
import 'package:uberscousin/views/Profile/about.dart';
import 'package:uberscousin/views/Profile/faq.dart';
import 'package:uberscousin/views/get_lift.dart';
import 'package:uberscousin/views/Profile/promotions.dart';
import 'package:uberscousin/views/request_history.dart';
import 'package:uberscousin/views/Profile/settings.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);
  static const textStyle = TextStyle(fontSize: 25, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.person_3,
                    size: 30,
                  ),
                  Text("Jack")
                ],
              ),
              Row(
                children: [
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Tooltip(
                    message: "This rating is by the driver",
                    child: Icon(Icons.info, color: Colors.white, size: 10),
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        ListTile(
          title:
              const Text("Home", style: textStyle, textAlign: TextAlign.center),
          onTap: () {
            Navigator.pop(context); // Close the drawer
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const GetLift()));
          },
        ),
        ListTile(
          title: const Text("Price History",
              style: textStyle, textAlign: TextAlign.center),
          onTap: () {
            Navigator.pop(context); // Close the drawer
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RequestHistory()));
          },
        ),
        ListTile(
          title: const Text('Promotions',
              style: textStyle, textAlign: TextAlign.center),
          onTap: () {
            Navigator.pop(context); // Close the drawer
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Promotions()));
          },
        ),
        ListTile(
          title: const Text('Settings',
              style: textStyle, textAlign: TextAlign.center),
          onTap: () {
            Navigator.pop(context); // Close the drawer
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Settings()));
          },
        ),
        ListTile(
          title: const Text('About',
              style: textStyle, textAlign: TextAlign.center),
          onTap: () {
            Navigator.pop(context); // Close the drawer
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const About()));
          },
        ),
        ListTile(
          title:
              const Text('FAQ', style: textStyle, textAlign: TextAlign.center),
          onTap: () {
            Navigator.pop(context); // Close the drawer
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const FAQ()));
          },
        ),
        const SizedBox(
          height: 40,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.facebook, size: 40),
            SizedBox(
              width: 30,
            ),
            Icon(
              Icons.wechat_sharp,
              size: 40,
            )
          ],
        ),
        // Add more ListTiles for additional pages
      ],
    );
  }
}
