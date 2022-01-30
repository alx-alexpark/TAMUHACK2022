import 'package:cloud_firestore/cloud_firestore.dart';

class PilotInfo {
  bool approved;
  String license_image;

  PilotInfo({required this.approved, required this.license_image});
}

class User {
  String uid;
  List<DocumentReference> flights;
  PilotInfo pilotInfo;

  User({required this.uid, required this.flights, required this.pilotInfo});
}
