import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tamuhack2022/pages/pilot/claimed_flights/claimed_flights_item.dart';
import 'package:tamuhack2022/pages/pilot/claimed_flights/claimed_flights_popup.dart';

class ClaimedFlightsTab extends StatelessWidget {
  const ClaimedFlightsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CollectionReference flights =
        FirebaseFirestore.instance.collection("flights");

    return FutureBuilder(
      future: flights
          .where("pilot", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .where("fulfilled", isEqualTo: false)
          .get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        return Container(
          width: size.width,
          height: size.height,
          color: Color(0xFF5F4AD8),
          child: Container(
            width: size.width,
            height: size.height,
            child: ListView(
              children: (snapshot as AsyncSnapshot<QuerySnapshot<Object?>>)
                  .data!
                  .docs
                  .map((e) {
                return ClaimedFlightsItem(
                  arrival: "ABC",
                  departure: "DEF",
                  time: DateTime.now(),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return ClaimedFindFlightsPopup(flightId: e.id);
                      },
                    );
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
