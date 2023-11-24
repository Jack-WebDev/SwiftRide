import 'package:flutter/material.dart';
import 'package:uberscousin/views/Onboarding/login.dart';

class Loader extends StatefulWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  late bool _isLoading = false;

  @override
  void initState() {
    _isLoading = true;

    Future.delayed(
        const Duration(seconds: 1),
        () => {
              setState(() {
                _isLoading = false;
              }),
            });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
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
          child: _isLoading
              ? const Column(
                  children: [
                    SizedBox(
                      height: 150,
                    ),
                    Text("Swift Ride",
                        style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 50,
                            color: Colors.white,
                            fontWeight: FontWeight.w700)),
                    SizedBox(
                      height: 150,
                    ),
                    Text("Journey with Ease, Arrive Swiftly!",
                        style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 100,
                    ),
                    CircularProgressIndicator(
                        color: Color(0xFF478DE0), backgroundColor: Colors.white)
                  ],
                )
              : _another()),
    );
  }
}

Widget _another() {
  return const Scaffold(
    body: SizedBox(
      height: double.infinity,
      child: LoginPage(),
    ),
  );
}
