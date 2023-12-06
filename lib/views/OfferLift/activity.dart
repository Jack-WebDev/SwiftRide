import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Activities extends StatefulWidget {
  const Activities({super.key});

  @override
  State<Activities> createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  CollectionReference _listDetails =
      FirebaseFirestore.instance.collection("offerlift");

  List<String> IDs = [];

  Future getIDs() async {
    await FirebaseFirestore.instance
        .collection("offerlift")
        .get()
        .then((snapshot) => snapshot.docs.forEach((val) {
              IDs.add(val.reference.id);
            }));
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: FutureBuilder(
                  future: getIDs(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                        itemCount: IDs.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: _card(_listDetails.doc(IDs[index]).get()),
                          );
                        });
                  },
                ),
              ),
            ))));
  }
}

Widget _card(Future<DocumentSnapshot> listDetails) {
  CollectionReference _listDetails =
      FirebaseFirestore.instance.collection("offerlift");

  // Future<void> isLiftAvailable() {
  //   return _listDetails
  //       .doc("IY4PAlonDDiF23HLRjUZ")
  //       .update({"Lift Available": "false"})
  //       .then((value) => print("User Updated"))
  //       .catchError((error) => print("Failed to update user: $error"));
  // }

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
        return const Text("Something went wrong");
      }

      if (snapshot.hasData && !snapshot.data!.exists) {
        return const Text("Document does not exist");
      }

      if (snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.blue,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Text(
                    "Driver Name: ${data["Driver Name"]}",
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text("Car Capacity: ${data["Car Capacity"]}",
                      style:
                          const TextStyle(color: Colors.white, fontSize: 20)),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              updateLift();
                            },
                            child: const Text("Edit Lift",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15))),
                        const SizedBox(
                          width: 15,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              deleteUser();
                            },
                            child: const Text("Delete Lift",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15))),
                        const SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }

      return const Text("Loading....");
    },
  );
}
