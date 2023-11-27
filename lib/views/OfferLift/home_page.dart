import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _driverName = TextEditingController();
  final _departure = TextEditingController();
  final _date = TextEditingController();
  final _time = TextEditingController();
  final _streetName = TextEditingController();
  final _town = TextEditingController();
  final _capacity = TextEditingController();

  Future createLift() async {
    liftDetails(
      _driverName.text.trim(),
      _departure.text.trim(),
      int.parse(_date.text.trim()),
      int.parse(_time.text.trim()),
      _streetName.text.trim(),
      _town.text.trim(),
      int.parse(_capacity.text.trim()),
    );
  }

  @override
  void dispose() {
    _driverName.dispose();
    _departure.dispose();
    _date.dispose();
    _time.dispose();
    _streetName.dispose();
    _town.dispose();
    _capacity.dispose();
    super.dispose();
  }

  Future liftDetails(String driverName, String departure, int date, int time,
      String streetName, String town, int capacity) async {
    await FirebaseFirestore.instance.collection("offerlift").add({
      "Driver Name": driverName,
      "Place of Departure": departure,
      "Date": date,
      "Time": time,
      "Street Name": streetName,
      "Town/Neighbourhood": town,
      "Car Capacity": capacity,
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
              child: Column(
                children: [
                  Text("Offer Lift?"),
                  SizedBox(
                    height: 50,
                  ),
                  TextField(
                    controller: _driverName,
                    decoration: InputDecoration(hintText: "Driver name"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _departure,
                    decoration: InputDecoration(hintText: "Place of departure"),
                  ),
                  TextField(
                    controller: _date,
                    decoration: InputDecoration(hintText: "Date"),
                  ),
                  TextField(
                    controller: _time,
                    decoration: InputDecoration(hintText: "Time"),
                  ),
                  TextField(
                    controller: _streetName,
                    decoration: InputDecoration(hintText: "Street Name"),
                  ),
                  TextField(
                    controller: _town,
                    decoration: InputDecoration(hintText: "Town/Neighbourhood"),
                  ),
                  TextField(
                    controller: _capacity,
                    decoration: InputDecoration(hintText: "Car Capacity"),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        createLift();
                      },
                      child: Text("Offer Lift!"))
                ],
              ),
            ))));
  }
}
