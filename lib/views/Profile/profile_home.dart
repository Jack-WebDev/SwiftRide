import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uberscousin/views/Profile/manage_account.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Jack Swift",
                                    style: TextStyle(fontSize: 40),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Row(
                                    children: [
                                      Icon(Icons.star),
                                      Icon(Icons.star),
                                      Icon(Icons.star),
                                      Icon(Icons.star_half),
                                      Icon(Icons.star_outline),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 2.5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(
                                          255, 70, 141, 221),
                                    ),
                                    child: const Row(
                                      children: [
                                        Icon(Icons.star),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Text("4.21")
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const CircleAvatar(
                                radius: 30,
                                child: Icon(Icons.person, size: 40),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 5,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white30,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const ListTile(
                          title: Text("Settings"),
                          leading: Icon(Icons.settings),
                        ),
                        const ListTile(
                          title: Text("Promotions"),
                          leading: Icon(Icons.wallet),
                        ),
                        const ListTile(
                          title: Text("Help"),
                          leading: Icon(Icons.help),
                        ),
                        const ListTile(
                          title: Text("FAQ"),
                          leading: Icon(Icons.abc),
                        ),
                        const ListTile(
                          title: Text("About"),
                          leading: Icon(Icons.unsubscribe_sharp),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ManageAccount()));
                          },
                          child: const ListTile(
                            title: Text("Manage Account"),
                            leading: Icon(Icons.person_2),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await FirebaseAuth.instance.signOut();
                          },
                          child: const ListTile(
                            title: Text("Sign Out"),
                            leading: Icon(Icons.exit_to_app),
                          ),
                        ),
                      ],
                    ),
                    const Column(
                      children: [Text("Version: 1.0")],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
