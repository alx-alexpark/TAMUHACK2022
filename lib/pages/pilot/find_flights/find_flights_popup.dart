import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BuildFindFlightsPopup extends StatelessWidget {
  final String flightId;

  const BuildFindFlightsPopup({Key? key, required this.flightId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> claimFlight() async {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        FirebaseFirestore.instance
            .collection("flights")
            .doc(flightId)
            .update({"pilot": FirebaseAuth.instance.currentUser!.uid});
      }
    }

    return AlertDialog(
      title: Text(
        "Are you sure you want to claim this flight?",
      ),
      content: TextButton(
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
        onPressed: () async {
          await claimFlight();
          Navigator.pop(context);
        },
        child: Text("Claim"),
      ),
    );
  }
}
