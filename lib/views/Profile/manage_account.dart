import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ManageAccount extends StatefulWidget {
  const ManageAccount({super.key});

  @override
  State<ManageAccount> createState() => _ManageAccountState();
}

class _ManageAccountState extends State<ManageAccount> {
  // XFile? _pickedImage;
  // Uint8List? _imageBytes;

  // Future<void> _pickImage(ImageSource source) async {
  //   final pickedImage = await ImagePicker()
  //       .pickImage(source: source, maxHeight: 100, maxWidth: 100);

  //   if (pickedImage != null) {
  //     final imageBytes = await pickedImage.readAsBytes();

  //     setState(() {
  //       _pickedImage = pickedImage;
  //       _imageBytes = imageBytes;
  //     });
  //   }
  // }

  // Widget _buildImageView() {
  //   if (_imageBytes == null) {
  //     return const Center(
  //       child: Icon(Icons.person),
  //     );
  //   } else {
  //     return Image.memory(_imageBytes!);
  //   }
  // }

  int _selectedIndex = 0;

  void _navigator(int index) {
    setState(() {
      _selectedIndex = index;
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Jack Swift",
                    style: TextStyle(fontSize: 40),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star_half),
                      Icon(Icons.star_outline),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              // Stack(
              //   children: [
              //     CircleAvatar(
              //       radius: 50,
              //       child: _buildImageView(),
              //     ),
              //     ElevatedButton(
              //         onPressed: () {
              //           _pickImage(ImageSource.gallery);
              //         },
              //         child: Text("Choose Image"))
              //   ],
              // ),
            ],
          ),
        )),
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.blue[700],
          currentIndex: _selectedIndex,
          onTap: _navigator,
          selectedFontSize: 20,
          selectedItemColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: "Your Activity",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Account",
            )
          ]),
    );
  }
}
