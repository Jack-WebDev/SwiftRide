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

  Future<void> isLiftAvailable() {
    return _listDetails
        .doc("IY4PAlonDDiF23HLRjUZ")
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
            Center(
              child: Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        updateLift();
                      },
                      child: Text("Edit Lift")),
                  SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        deleteUser();
                      },
                      child: Text("Delete Lift")),
                  SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        isLiftAvailable();
                      },
                      child: Text("Get Lift"))
                ],
              ),
            )
          ],
        );
      }

      return Text("loading");
    },
  );
}
