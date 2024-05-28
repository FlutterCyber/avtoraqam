import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:avtoraqam/pages/home_page.dart';
import 'package:avtoraqam/pages/search_pinfl_page.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class BottomNavBar extends StatefulWidget {
  static const String id = "bottom_nav_bar";

  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<IconData> iconList = [
    IconlyBold.home,
    IconlyBold.paper,
    IconlyBold.calendar,
    IconlyBold.profile
  ];

  int _bottomNavIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PageView(
          controller: pageController,
          scrollDirection: Axis.horizontal,
          children: [
            HomePage(),
            SearchPinflPage(),
            Container(color: Colors.grey.shade300),
            Container(color: Colors.grey.shade50),
          ],
          onPageChanged: (int index) {
            setState(
              () {
                _bottomNavIndex = index;
                pageController = PageController(initialPage: index);
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            pageController = PageController(initialPage: 1);
            //Navigator.pushReplacementNamed(context, AddNewTaskScreen.id);
          });
        },
        focusElevation: 50,
        splashColor: Colors.yellow.withOpacity(0.5),
        hoverColor: Colors.yellow,
        focusColor: Colors.cyan,
        backgroundColor: const Color(0xff427D9D),
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Icon(
          Icons.qr_code_scanner,
          color: Colors.white,
          size: 25,
          shadows: [Shadow(offset: Offset.fromDirection(1), blurRadius: 10)],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        color: Colors.transparent,
        child: AnimatedBottomNavigationBar(
            backgroundColor: const Color(0xffDDF2FD),
            leftCornerRadius: 30,
            rightCornerRadius: 30,
            icons: iconList,
            activeIndex: _bottomNavIndex,
            gapLocation: GapLocation.center,
            notchMargin: 8,
            activeColor: const Color(0xff164863),
            inactiveColor: const Color(0xff9BBEC8),
            notchSmoothness: NotchSmoothness.softEdge,
            onTap: (index) {
              setState(() {
                _bottomNavIndex = index;
                pageController.jumpToPage(index);
              });
            }),
      ),
    );
  }
}
