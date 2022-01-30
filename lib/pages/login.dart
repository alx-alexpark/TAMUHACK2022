import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tamuhack2022/pages/bottom_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5F4AD8),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
          ),
          Positioned(
            left: 20,
            top: MediaQuery.of(context).size.height * 0.4 - 50,
            child: const Text(
              "Planer",
              style: TextStyle(
                color: Color(0xFF5F4AD8),
                fontSize: 50,
              ),
            ),
          ),
          Positioned(
            right: 40,
            top: MediaQuery.of(context).size.height * 0.4 - 35,
            child: TextButton(
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
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F5FB),
                  border: Border.all(color: const Color(0xFF5F4AD8), width: 15),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF5F4AD8),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: MediaQuery.of(context).size.width - 325,
            top: MediaQuery.of(context).size.height - 275,
            child: Image.asset(
              "assets/images/plane.png",
              width: 300,
            ),
          )
        ],
      ),
    );
  }
}
