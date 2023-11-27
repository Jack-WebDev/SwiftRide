import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uberscousin/views/get_lift.dart';
import 'package:uberscousin/views/OfferLift/offer_lift.dart';

class LiftOptions extends StatefulWidget {
  const LiftOptions({Key? key}) : super(key: key);

  @override
  State<LiftOptions> createState() => _LiftOptionsState();
}

class _LiftOptionsState extends State<LiftOptions> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    );
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
            child: Center(
              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    style: raisedButtonStyle,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GetLift()));
                    },
                    child:
                        const Text("Get Lift", style: TextStyle(fontSize: 30)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      style: raisedButtonStyle,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OfferLift()));
                      },
                      child: const Text("Offer Lift",
                          style: TextStyle(fontSize: 30)))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
