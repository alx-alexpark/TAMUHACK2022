// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PilotSignupScreen extends StatelessWidget {
  const PilotSignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    CollectionReference users = FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    Future<void> applyPilot() {
      // Call the user's CollectionReference to add a new user
      return users
          .doc(user?.uid)
          .set({
            'pilot_info': {'approved': true, 'license_image': "no"}
          }, SetOptions(merge: true))
          .then((value) => print("Applied for pilot"))
          .catchError((error) => print("Failed to apply pilot: $error"));
    }

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "First Lastname",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.08,
            ),
            Text(
              "Apply to be a pilot",
              style: TextStyle(
                fontSize: 45, fontWeight: FontWeight.w500,
                // fontFamily: "Geometria-Medium"
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Text(
              "Upload your license",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width: 275,
                height: 200,
                color: const Color(0xFFB49EF3),
                child: MaterialButton(
                  onPressed: () {},
                  child: const Center(child: Icon(Icons.upload, size: 40)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(10.0),
                  backgroundColor: Color(0xFF5F4AD8),
                  primary: Colors.white,
                  textStyle: TextStyle(
                    fontFamily: "Geometria",
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: applyPilot,
                child: Text("Submit"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
