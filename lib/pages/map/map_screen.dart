import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  String departureText = "";
  String arrivalText = "";
  String dateText = "";
  GoogleMapController? googleMapController;

  void _onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: const CameraPosition(
                target: LatLng(0.0, 0.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                      spreadRadius: 0.0,
                    )
                  ],
                ),
                child: const TextField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Howdy! Where ya goin'?",
                  ),
                  style: TextStyle(
                    backgroundColor: Colors.white,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
        panel: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                child: const SizedBox(
                  height: 6,
                  width: 100,
                ),
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
              ),
            ),
            const Text(
              "Book Flight",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 75,
              width: 75,
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        "Depart",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          departureText,
                          style: const TextStyle(
                            backgroundColor: Color(0x00B49EF3),
                          ),
                        ),
                        // clipBehavior: ClipRRect(
                        //   borderRadius: Border.all(10),
                        // ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        "Arrive",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(arrivalText),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        "Time",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      // Replace with date picker
                      TextButton(
                        onPressed: () {},
                        child: Text(dateText),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
    );
  }
}
