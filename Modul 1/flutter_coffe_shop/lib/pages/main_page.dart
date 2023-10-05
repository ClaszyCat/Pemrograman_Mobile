import 'package:flutter/material.dart';
import 'package:flutter_coffe_shop/pages/home_page.dart';
import 'package:flutter_coffe_shop/util/coffee_tile.dart';
import 'package:flutter_coffe_shop/util/coffee_type.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  Widget customBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (value) {
        setState(() {
          currentIndex = value;
        });
      },
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 10),
              child: Image.asset(
                'assets/images/home_icon.png',
                width: 21,
                color: currentIndex == 0
                    ? const Color.fromARGB(255, 215, 149, 125)
                    : Colors.grey,
              ),
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 10),
              child: Image.asset(
                'assets/images/bag_icon.png',
                width: 20,
                color: currentIndex == 1
                    ? const Color.fromARGB(255, 215, 149, 125)
                    : Colors.grey,
              ),
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 10),
              child: Image.asset(
                'assets/images/heart_icon.png',
                width: 21,
                color: currentIndex == 2
                    ? const Color.fromARGB(255, 215, 149, 125)
                    : Colors.grey,
              ),
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 10),
              child: Image.asset(
                'assets/images/notif_icon.png',
                width: 21,
                color: currentIndex == 3
                    ? const Color.fromARGB(255, 215, 149, 125)
                    : Colors.grey,
              ),
            ),
            label: ''),
      ],
    );
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return Text("test");
      case 2:
        return Text("test");
      case 3:
        return Text("test");
      default:
        return HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: customBottomNavBar(),
        body: body());
  }
}
