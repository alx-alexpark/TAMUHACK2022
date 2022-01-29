import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  void _anonymouslogin() async {
    Firebase.initializeApp();
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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('LoginScreen', textDirection: TextDirection.ltr),
      TextButton(onPressed: _anonymouslogin, child: Text("anonymous gogin"))
    ]));
  }
}
