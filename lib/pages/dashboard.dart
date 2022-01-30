import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tamuhack2022/pages/pilot_signup.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(user?.uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

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
                        SizedBox(
                          height: 100,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * 0.07,
                            ),
                            Container(
                              width: 55,
                              height: 55,
                              decoration: const BoxDecoration(
                                color: Color(0xFF5F4AD8),
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 30),
                            Text(
                              data['name'],
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Stack(
                      children: [
                        Container(
                          width: size.width,
                          height: size.height * 0.8,
                          decoration: const BoxDecoration(
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
                            decoration: const BoxDecoration(
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
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
