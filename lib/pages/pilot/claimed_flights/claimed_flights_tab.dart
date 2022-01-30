import 'package:flutter/material.dart';
import 'package:tamuhack2022/pages/pilot/claimed_flights/claimed_flights_item.dart';

class ClaimedFlightsTab extends StatelessWidget {
  const ClaimedFlightsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      color: Color(0xFF5F4AD8),
      child: Container(
        width: size.width,
        height: size.height,
        child: ListView(
          children: [
            ClaimedFlightsItem(
              arrival: "ABC",
              departure: "DEF",
              time: DateTime.now(),
            ),
            ClaimedFlightsItem(
              arrival: "ABC",
              departure: "DEF",
              time: DateTime.now(),
            ),
            ClaimedFlightsItem(
              arrival: "ABC",
              departure: "DEF",
              time: DateTime.now(),
            ),
            ClaimedFlightsItem(
              arrival: "ABC",
              departure: "DEF",
              time: DateTime.now(),
            ),
            ClaimedFlightsItem(
              arrival: "ABC",
              departure: "DEF",
              time: DateTime.now(),
            ),
            ClaimedFlightsItem(
              arrival: "ABC",
              departure: "DEF",
              time: DateTime.now(),
            ),
            ClaimedFlightsItem(
              arrival: "ABC",
              departure: "DEF",
              time: DateTime.now(),
            ),
            ClaimedFlightsItem(
              arrival: "ABC",
              departure: "DEF",
              time: DateTime.now(),
            ),
            ClaimedFlightsItem(
              arrival: "ABC",
              departure: "DEF",
              time: DateTime.now(),
            ),
            ClaimedFlightsItem(
              arrival: "ABC",
              departure: "DEF",
              time: DateTime.now(),
            ),
            ClaimedFlightsItem(
              arrival: "ABC",
              departure: "DEF",
              time: DateTime.now(),
            ),
            ClaimedFlightsItem(
              arrival: "ABC",
              departure: "DEF",
              time: DateTime.now(),
            ),
            ClaimedFlightsItem(
              arrival: "ABC",
              departure: "DEF",
              time: DateTime.now(),
            ),
            ClaimedFlightsItem(
              arrival: "ABC",
              departure: "DEF",
              time: DateTime.now(),
            ),
          ],
        ),
      ),
    );
  }
}
