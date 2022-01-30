import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tamuhack2022/pages/bottom_bar.dart';
import 'package:tamuhack2022/pages/maps/book_flight_form.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? googleMapController;
  bool isArrival = false;
  TextEditingController arrivalInputController =
      TextEditingController(text: "");
  TextEditingController departInputController = TextEditingController(text: "");
  DateTime fullDate = DateTime.now();
  List data = [];

  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/json/tx_coords.json');
    setState(() => data = json.decode(jsonText));
    return 'success';
  }

  @override
  void initState() {
    super.initState();
    this.loadJsonData();
  }

  void _onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CollectionReference flights =
        FirebaseFirestore.instance.collection("flights");

    Future<void> addFlight() async {
      User? user = FirebaseAuth.instance.currentUser;
      print(user);
      if (user != Null) {
        flights.add({
          "arrival": arrivalInputController.value.text,
          "departure": departInputController.value.text,
          "fulfilled": false,
          "passenger": FirebaseAuth.instance.currentUser!.uid,
          "pilot": "",
          "time": Timestamp.fromDate(fullDate)
        });
      }
    }

    return Scaffold(
      body: SlidingUpPanel(
        minHeight: 37,
        maxHeight: MediaQuery.of(context).size.height -
            (bottomBarKey.currentContext?.findRenderObject() as RenderBox)
                .size
                .height,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        body: SizedBox(
          height: 300,
          width: 300,
          child: FutureBuilder(
            future: loadJsonData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GoogleMap(
                  myLocationEnabled: false,
                  markers: (data)
                      .map(
                        (e) => Marker(
                          onTap: () {
                            if (isArrival) {
                              arrivalInputController.value =
                                  arrivalInputController.value.copyWith(
                                text: e['code'],
                                selection: TextSelection(
                                    baseOffset: e['code'].length,
                                    extentOffset: e['code'].length),
                                composing: TextRange.empty,
                              );
                            } else {
                              departInputController.value =
                                  departInputController.value.copyWith(
                                text: e['code'],
                                selection: TextSelection(
                                    baseOffset: e['code'].length,
                                    extentOffset: e['code'].length),
                                composing: TextRange.empty,
                              );
                            }
                          },
                          markerId: MarkerId(e['code']),
                          infoWindow:
                              InfoWindow(title: "${e['name']}-${e['code']}"),
                          position: LatLng(
                            double.parse(e['lat']),
                            double.parse(e['lon']),
                          ),
                        ),
                      )
                      .toSet(),
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(0.0, 0.0),
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
          ),
        ),
        panel: Column(
          children: [
            SizedBox(
              height: 15,
              width: 15,
            ),
            Container(
              height: 7,
              width: 200,
              decoration: BoxDecoration(
                color: Color(0xFFd3d3d3),
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
            ),
            Container(
              height: size.height * 0.1,
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  "Book Flight",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  BookFlightForm(
                    arrivalInputController: arrivalInputController,
                    departInputController: departInputController,
                    onArrivalTap: () {
                      setState(() {
                        isArrival = true;
                      });
                    },
                    onDepartTap: () {
                      setState(() {
                        isArrival = false;
                      });
                    },
                    onDateChange: (DateTime date) {
                      setState(() {
                        fullDate = DateTime(date.year, date.month, date.day,
                            fullDate.hour, fullDate.minute, 0);
                      });
                    },
                    onTimeChange: (TimeOfDay time) {
                      setState(() {
                        fullDate = DateTime(fullDate.year, fullDate.month,
                            fullDate.day, time.hour, time.minute);
                      });
                    },
                    submit: () async {
                      return addFlight();
                    },
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
