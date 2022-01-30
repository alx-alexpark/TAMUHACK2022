import 'package:flutter/material.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:tamuhack2022/pages/account.dart';
import 'package:tamuhack2022/pages/dashboard.dart';
import 'package:tamuhack2022/pages/maps/map_screen.dart';
import 'package:tamuhack2022/pages/pilot_signup.dart';
import 'package:tamuhack2022/pages/pilotdashboard.dart';

class BottomBarTest extends StatefulWidget {
  const BottomBarTest({Key? key}) : super(key: key);

  @override
  _BottomBarTestState createState() => _BottomBarTestState();
}

class _BottomBarTestState extends State<BottomBarTest> {
  int _currentPage = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          DashboardScreen(),
          MapScreen(),
          //AccountScreen(),
          false ? PilotDashboard() : PilotSignupScreen()
        ],
        onPageChanged: (index) {
          // Use a better state management solution
          // setState is used for simplicity
          setState(() => _currentPage = index);
        },
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: _currentPage,
        onTap: (int index) {
          _pageController.jumpToPage(index);
          setState(() => _currentPage = index);
        },
        items: <BottomBarItem>[
          BottomBarItem(
            icon: Icon(Icons.bolt),
            title: Text('Dashboard'),
            activeColor: Colors.greenAccent.shade700,
            darkActiveColor: Colors.greenAccent.shade400,
          ),
          BottomBarItem(
            icon: Icon(Icons.map),
            title: Text('Map'),
            activeColor: Colors.red,
            darkActiveColor: Colors.red.shade400,
          ),
          /*BottomBarItem(
            icon: Icon(Icons.person),
            title: Text('Account'),
            activeColor: Colors.blue,
          ),*/
          BottomBarItem(
            icon: Icon(Icons.flight),
            title: Text('Pilot Dashboard'),
            activeColor: Colors.red,
          )
        ],
      ),
    );
  }
}
