import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Activities extends StatefulWidget {
  const Activities({super.key});

  @override
  State<Activities> createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
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
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Your Activity",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Column(
                        children: [
                          Text(
                            "Your Lifts",
                            style: TextStyle(fontSize: 25),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Your Past Rides:",
                            style: TextStyle(fontSize: 25),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          _card("12 Common Place Str")
                        ],
                      ),
                    ]),
              ),
            ))));
  }
}

Widget _card(String streetName) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(15)),
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Image(image: AssetImage("assets/images/facebook.jpg")),
          const SizedBox(
            height: 20,
          ),
          Text(streetName),
          const Text("23:03 PM - 18/12/2023"),
          const Text("R0.00 - Cancelled")
        ],
      ),
    ),
  );
}
