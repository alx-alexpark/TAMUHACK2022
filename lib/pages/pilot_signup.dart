// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class PilotSignupScreen extends StatelessWidget {
  const PilotSignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    style: TextStyle(
                      fontSize: 30,
                    )
                  )
                )
              ]
            ),
            SizedBox(height: 80),
            Text(
              "Apply to be a pilot",
              style: TextStyle(
                fontSize: 60,
                // fontFamily: "Geometria-Medium"
              ),
            ),
            SizedBox(height: 80),
            Text(
              "Upload your license",
              style: TextStyle(
                fontSize: 20
              )
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width: 275,
                height: 200,
                color: const Color(0xFFB49EF3),
                child: MaterialButton(
                  onPressed: (){

                  },
                  child: const Center(
                    child: Icon(
                      Icons.upload,
                      size: 40
                    )
                  ),
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: MaterialButton(
                onPressed: () {},
                child: Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 30
                  )
                ),
                color: Color(0xFF5F4AD8)
              ),
            )
          ]
        )
      )
    );
  }
}
