import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ClaimedFindFlightsPopup extends StatelessWidget {
  final String flightId;

  const ClaimedFindFlightsPopup({Key? key, required this.flightId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> claimFlight() async {
      FirebaseFirestore.instance
          .collection("flights")
          .doc(flightId)
          .update({"fulfilled": true});
    }

    return AlertDialog(
      title: Text(
        "Fulfill this request?",
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
        child: Text("Fulfilled"),
      ),
    );
  }
}
