import 'package:flutter/material.dart';
import 'package:tamuhack2022/pages/pilot_signup.dart';
import 'package:tamuhack2022/pages/pilotdashboard.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(color: Color(0xFFF0F5FB)),
          child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Container(
                          width: size.width,
                          height: size.height * 0.17,
                          color: Color(0xFFFFFF),
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * 0.05,
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.all(10.0),
                                  backgroundColor: Color(0xFF5F4AD8),
                                  primary: Colors.white,
                                  textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => PilotSignupScreen()));
                                },
                                child: const Text("Sign up to be a pilot"),
                              ),
                            ],
                          )),
                      Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.07,
                          ),
                          Container(
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                              color: Color(0xFF5F4AD8),
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 30),
                          Text(
                            "First Lastname",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ],
                  )),
              Expanded(
                flex: 7,
                child: Stack(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height * 0.8,
                      decoration: BoxDecoration(
                        color: Color(0xFF5F4AD8),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: size.width,
                        height: size.height * 0.45,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
