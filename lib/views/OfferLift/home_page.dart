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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 30),
                      child: Column(
                        children: [
                          const Text(
                            "Offer Lift to your desired destination",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextField(
                            controller: _driverName,
                            decoration: const InputDecoration(
                                label: Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Driver Name",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: _destination,
                            decoration: const InputDecoration(
                                label: Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Destination",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: _departure,
                            decoration: const InputDecoration(
                                label: Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Place of Departure",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              TextField(
                                controller: _date,
                                decoration: InputDecoration(
                                    label: const Padding(
                                      padding: EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        "Date",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          _selectDate(context);
                                        },
                                        icon: const Icon(
                                          Icons.calendar_month,
                                          color: Colors.white,
                                        ))),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: _time,
                            decoration: const InputDecoration(
                                label: Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Time(15:00)",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: _streetName,
                            decoration: const InputDecoration(
                                label: Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Street Name",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: _town,
                            decoration: const InputDecoration(
                                label: Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Town/Neighbourhood",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: _capacity,
                            decoration: const InputDecoration(
                                label: Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Car Capacity",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                createLift();
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "OFFER LIFT",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ))
                        ],
                      ),
                    )))));
  }
}
