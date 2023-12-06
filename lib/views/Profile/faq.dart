import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FAQ extends StatefulWidget {
  const FAQ({super.key});

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  int _selectedIndex = 0;

  void _navigator(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const headerStyle = TextStyle(
      color: Color(0xffffffff), fontSize: 18, fontWeight: FontWeight.bold);
  static const contentStyleHeader = TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
  static const contentStyle = TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);
  static const loremIpsum =
      '''Lorem ipsum is typically a corrupted version of 'De finibus bonorum et malorum', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.''';
  static const slogan =
      'Do not forget to play around with all sorts of colors, backgrounds, borders, etc.';

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
          child: Accordion(
            headerBorderColor: Colors.blueGrey,
            headerBorderColorOpened: Colors.transparent,
            // headerBorderWidth: 1,
            headerBackgroundColorOpened: Colors.green,
            contentBackgroundColor: Colors.white,
            contentBorderColor: Colors.green,
            contentBorderWidth: 3,
            contentHorizontalPadding: 20,
            scaleWhenAnimating: true,
            openAndCloseAnimation: true,
            headerPadding:
                const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
            sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
            sectionClosingHapticFeedback: SectionHapticFeedback.light,
            children: [
              AccordionSection(
                isOpen: true,
                contentVerticalPadding: 20,
                leftIcon:
                    const Icon(Icons.text_fields_rounded, color: Colors.white),
                header: const Text('Simple Text', style: headerStyle),
                content: const Text(loremIpsum, style: contentStyle),
              ),
              AccordionSection(
                isOpen: false,
                leftIcon: const Icon(Icons.circle, color: Colors.white),
                headerBorderRadius: 0,
                headerBackgroundColor: Colors.black87,
                headerBackgroundColorOpened: Colors.black87,
                headerBorderColorOpened: const Color(0xffaaaaaa),
                headerBorderWidth: 1,
                contentBackgroundColor: Colors.black54,
                contentBorderColor: const Color(0xffaaaaaa),
                contentBorderWidth: 1,
                contentBorderRadius: 0,
                contentVerticalPadding: 30,
                header: const Text('Android', style: headerStyle),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.label_important_outline_rounded,
                      size: 50,
                      color: Colors.white54,
                    ),
                    const Flexible(
                      child: Text(
                        slogan,
                        maxLines: 4,
                        style: TextStyle(color: Colors.white54, fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
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
