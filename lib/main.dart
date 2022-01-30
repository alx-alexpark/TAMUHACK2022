import 'package:flutter/material.dart';
import 'package:tamuhack2022/pages/dashboard.dart';
import 'package:tamuhack2022/pages/loading_screen.dart';
import 'package:tamuhack2022/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tamuhack2022/pages/pilot_signup.dart';
import 'package:tamuhack2022/pages/maps/map_screen.dart';
import 'package:tamuhack2022/pages/pilot/pilot_screen.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planer',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        fontFamily: "Geometria-Medium",
      ),
      home: const LoginScreen(),
    );
  }

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
            theme: ThemeData(fontFamily: "Geometria"),
            home: const Scaffold(
              body: LoginScreen(),
            ),
          );
        }

        return LoadingScreen();
      },
    );
  }
}
