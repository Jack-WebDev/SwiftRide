import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _driverName = TextEditingController();
  final _destination = TextEditingController();
  final _departure = TextEditingController();
  final _date = TextEditingController();
  final _time = TextEditingController();
  final _streetName = TextEditingController();
  final _town = TextEditingController();
  final _capacity = TextEditingController();
  final _available = true;

  Future createLift() async {
    liftDetails(
      _driverName.text.trim(),
      _destination.text.trim(),
      _departure.text.trim(),
      _date.text.trim(),
      _time.text.trim(),
      _streetName.text.trim(),
      _town.text.trim(),
      _capacity.text.trim(),
      _available,
    );
  }

  @override
  void dispose() {
    _driverName.dispose();
    _destination.dispose();
    _departure.dispose();
    _date.dispose();
    _streetName.dispose();
    _town.dispose();
    _capacity.dispose();
    super.dispose();
  }

  Future liftDetails(
      String driverName,
      String destination,
      String departure,
      String date,
      String time,
      String streetName,
      String town,
      String capacity,
      bool available) async {
    await FirebaseFirestore.instance.collection("offerlift").add(
      {
        "Driver Name": driverName,
        "Destination": destination,
        "Place of Departure": departure,
        "Date": date,
        "Time": time,
        "Street Name": streetName,
        "Town/Neighbourhood": town,
        "Car Capacity": capacity,
        "Lift Available": available,
        "Created at": FieldValue.serverTimestamp(),
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != DateTime.now()) {
      // Format the picked date using intl package
      String formattedDate = DateFormat('yyyy-MM-dd').format(picked);

      // Set the formatted date to the TextField
      _date.text = formattedDate;
    }
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
                          controller: _destination,
                          decoration: InputDecoration(hintText: "Destination"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: _departure,
                          decoration:
                              InputDecoration(hintText: "Place of departure"),
                        ),
                        Column(
                          children: [
                            TextField(
                              controller: _date,
                              decoration: InputDecoration(
                                  hintText: "Date",
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        _selectDate(context);
                                      },
                                      icon: Icon(Icons.calendar_month))),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextField(
                          controller: _time,
                          decoration: InputDecoration(hintText: "Time (15:00)"),
                        ),
                        TextField(
                          controller: _streetName,
                          decoration: InputDecoration(hintText: "Street Name"),
                        ),
                        TextField(
                          controller: _town,
                          decoration:
                              InputDecoration(hintText: "Town/Neighbourhood"),
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
                    )))));
  }
}
