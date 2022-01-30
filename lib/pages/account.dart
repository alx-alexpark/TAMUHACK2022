// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tamuhack2022/pages/dashboard.dart';
import 'package:tamuhack2022/pages/pilot_signup.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  Widget settingsItem(Widget screen, String text, BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        alignment: Alignment.centerLeft,
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => screen));
      },
      child: Text(
        text,
        style: TextStyle(fontSize: 35),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "Account Settings",
              style: TextStyle(fontSize: 50),
            ),
            ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20.0),
              children: [
                settingsItem(
                  DashboardScreen(),
                  "Change Username",
                  context,
                ),
                Divider(),
                settingsItem(
                  PilotSignupScreen(),
                  "Sign up to be a pilot",
                  context,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
