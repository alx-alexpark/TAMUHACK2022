import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tamuhack2022/pages/bottombartest.dart';
import 'package:tamuhack2022/main.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  void _anonymouslogin(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    UserCredential userCredential =
        await FirebaseAuth.instance.signInAnonymously();

    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const BottomBarTest(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('LoginScreen', textDirection: TextDirection.ltr),
            TextButton(
              onPressed: () async {
                FirebaseAuth auth = FirebaseAuth.instance;
                FirebaseAuth.instance.authStateChanges().listen((User? user) {
                  if (user == null) {
                    print('User is currently signed out!');
                  } else {
                    print('User is signed in!');
                  }
                });
                UserCredential userCredential =
                    await FirebaseAuth.instance.signInAnonymously();

                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const BottomBarTest(),
                  ),
                );
              },
              child: Text("anonymous gogin"),
            ),
          ],
        ),
      ),
    );
  }
}
