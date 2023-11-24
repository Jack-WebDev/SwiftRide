import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

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
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: [
                    //     const Row(
                    //       children: [
                    //         Icon(Icons.home),
                    //         SizedBox(
                    //           width: 20,
                    //         ),
                    //         Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Text(
                    //               "Home",
                    //               style: TextStyle(fontWeight: FontWeight.bold),
                    //             ),
                    //             SizedBox(
                    //               height: 5,
                    //             ),
                    //             Text("34 Maximus Avenue")
                    //           ],
                    //         ),
                    //       ],
                    //     ),
                    //     const SizedBox(
                    //       width: 40,
                    //     ),
                    //     IconButton(
                    //         onPressed: () {},
                    //         icon: Icon(Icons.arrow_forward_ios_sharp))
                    //   ],
                    // ),
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
                  ],
                ),
              ),
            ))));
  }
}
