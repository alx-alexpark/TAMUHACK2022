import 'package:flutter/material.dart';
import 'package:tamuhack2022/pages/dashboard.dart';
import 'package:tamuhack2022/pages/loading_screen.dart';
import 'package:tamuhack2022/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container(
            color: Colors.red,
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: LoginScreen(),
            ),
          );
        }

        return LoadingScreen();
      },
    );
  }
}
