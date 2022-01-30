import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:tamuhack2022/pages/account.dart';
import 'package:tamuhack2022/pages/dashboard.dart';
import 'package:tamuhack2022/pages/maps/map_screen.dart';
import 'package:tamuhack2022/pages/pilot/pilot_screen.dart';
import 'package:tamuhack2022/pages/pilot_signup.dart';

final GlobalKey bottomBarKey = GlobalKey();

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({Key? key}) : super(key: key);

  @override
  _BottomBarWidgetState createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  int _currentPage = 0;
  final _pageController = PageController();
  final Future<DocumentSnapshot> _future = FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .get();
  final Stream<DocumentSnapshot> _usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: _usersStream,
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        return Scaffold(
          body: PageView(
            controller: _pageController,
            children: [
              DashboardScreen(),
              MapScreen(),
              //AccountScreen(),
              data['pilot_info']['approved']
                  ? PilotScreen()
                  : PilotSignupScreen()
            ],
            onPageChanged: (index) {
              // Use a better state management solution
              // setState is used for simplicity
              setState(() => _currentPage = index);
            },
          ),
          bottomNavigationBar: BottomBar(
            key: bottomBarKey,
            selectedIndex: _currentPage,
            onTap: (index) {
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
      },
    );
  }
}
