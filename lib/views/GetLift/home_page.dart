import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  CollectionReference _listDetails =
      FirebaseFirestore.instance.collection("offerlift");

  List<String> IDs = [];
  List<Map<String, dynamic>> _searchResult = [];

  Future getIDs() async {
    await FirebaseFirestore.instance
        .collection("offerlift")
        .get()
        .then((snapshot) => snapshot.docs.forEach((val) {
              IDs.add(val.reference.id);
            }));
  }

  Future<void> searchFromFirebase(String query) async {
    try {
      final result = await FirebaseFirestore.instance
          .collection('offerlift')
          .where('Destination', isEqualTo: query)
          .get();

      setState(() {
        _searchResult =
            result.docs.map((e) => e.data() as Map<String, dynamic>).toList();
      });
    } catch (e) {
      print('Error searching from Firebase: $e');
    }
  }

  // Future getLocation() async {
  //   await FirebaseFirestore.instance
  //       .collection("offerlift")
  //       .where("Destination", isEqualTo: _searchController)
  //       .get();
  // }

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
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                child: Column(
                  children: [
                    TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {},
                        ),
                        prefixIconColor: Colors.white,
                        hintText: 'Where to?',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _searchController.clear();
                          },
                        ),
                        suffixIconColor: Colors.white,
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                      style: const TextStyle(color: Colors.white),
                      onChanged: (query) {
                        searchFromFirebase(query);
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const ListTile(
                      title: Text("Home"),
                      subtitle: Text("24 Max Ave"),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Coming Soon",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Icon(Icons.delivery_dining),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Delivery",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Icon(Icons.calendar_month),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Reserve Ride",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Icon(Icons.family_restroom),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Group Ride",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Icon(Icons.travel_explore),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Travel/Explore",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 250,
                          child: FutureBuilder(
                            future: getIDs(),
                            builder: (context, snapshot) {
                              return ListView.builder(
                                  itemCount: IDs.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: _card(
                                          _listDetails.doc(IDs[index]).get()),
                                    );
                                  });
                            },
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _searchResult.length,
                        itemBuilder: (context, index) {
                          // return ListTile(
                          //   title: Text(_searchResult[index]['Driver Name']),
                          //   subtitle: Text(_searchResult[index]['Destination']),
                          // );
                          return SizedBox(
                            child: Column(children: [
                              Text(
                                  "Driver Name: ${_searchResult[index]['Driver Name']}"),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                  "Destination: ${_searchResult[index]['Destination']}"),
                              Text(
                                  "Place of Departure: ${_searchResult[index]['Place of Departure']}"),
                              Text(
                                  "Car Capacity: ${_searchResult[index]['Car Capacity']}"),
                              Text(
                                  "Lift Available: ${_searchResult[index]['Lift Available']}"),
                              Text(
                                  "Date and Time: ${_searchResult[index]['Date']}"),

                              // SizedBox(height: 5,),
                            ]),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ))));
  }
}

Widget _card(Future<DocumentSnapshot> listDetails) {
  CollectionReference _listDetails =
      FirebaseFirestore.instance.collection("offerlift");

  Future<void> isLiftAvailable() {
    return _listDetails
        .doc("D96cJN9aN0IUivuE5m0O")
        .update({"Lift Available": "false"})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> updateLift() {
    return _listDetails
        .doc("3fFOg93r40UpW55uwcSu")
        .update({
          "Driver Name": "Jack",
        })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> deleteUser() {
    return _listDetails
        .doc('3fFOg93r40UpW55uwcSu')
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  return FutureBuilder(
    future: listDetails,
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Text("Something went wrong");
      }

      if (snapshot.hasData && !snapshot.data!.exists) {
        return Text("Document does not exist");
      }

      if (snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        return Column(
          children: [
            Text("Driver Name: ${data["Driver Name"]}"),
            SizedBox(
              height: 5,
            ),
            Text("Car Capacity: ${data["Car Capacity"]}"),
            SizedBox(
              height: 10,
            ),
          ],
        );
      }

      return Text("loading");
    },
  );
}
