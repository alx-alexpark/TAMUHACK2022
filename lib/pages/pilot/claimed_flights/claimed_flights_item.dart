import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:core';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class ClaimedFlightsItem extends StatelessWidget {
  final String arrival;
  final String departure;
  final DateTime time;
  final Function onTap;

  ClaimedFlightsItem({
    required this.arrival,
    required this.departure,
    required this.time,
    required this.onTap,
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: size.width,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        departure,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(Icons.arrow_right_alt,
                          size: 20, color: Colors.white),
                      Text(
                        arrival,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              width: size.width * 0.01,
            ),
            Container(
              width: size.width * 0.6,
              child: Column(
                children: [
                  Flexible(
                    child: Text(
                      DateFormat.yMMMMd('en_US').format(time),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      "${time.toUtc().hour}:${time.toUtc().minute}:${time.toUtc().millisecond} ${time.toUtc().hour > 12 ? "PM" : "AM"} UTC",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
