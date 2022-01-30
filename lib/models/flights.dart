import 'package:cloud_firestore/cloud_firestore.dart';

class Flights {
  String id;
  String arrival;
  String departure;
  String eta;
  bool fulfilled;
  DocumentReference passanger;
  DocumentReference pilot;
  Timestamp time;

  Flights(
      {required this.id,
      required this.arrival,
      required this.departure,
      required this.eta,
      required this.fulfilled,
      required this.passanger,
      required this.pilot,
      required this.time});
}
