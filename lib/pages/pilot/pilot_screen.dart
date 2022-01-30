import 'package:flutter/material.dart';
import 'package:tamuhack2022/pages/pilot/claimed_flights/claimed_flights_tab.dart';
import 'package:tamuhack2022/pages/pilot/find_flights/claimed_flights_tab.dart';
import 'package:tamuhack2022/pages/pilot/pilot_tab.dart';

class _PilotScreenState extends State<PilotScreen>
    with TickerProviderStateMixin {
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: size.width,
              height: size.height * 0.2,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.1,
                    ),
                    Text(
                      "Pilot Dashboard",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: DefaultTabController(
              length: 2,
              child: Container(
                width: size.width,
                height: size.height * 0.8,
                child: Column(
                  children: [
                    TabBar(
                      onTap: (x) {
                        setState(() {
                          tabIndex = x;
                        });
                      },
                      indicatorColor: Color(0xFF5F4AD8),
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: [
                        PilotTab(
                          selected: tabIndex == 0,
                          title: "Claimed Flights",
                        ),
                        PilotTab(
                          selected: tabIndex == 1,
                          title: "Find Flights",
                        ),
                      ],
                    ),
                    const Expanded(
                      child: TabBarView(
                        children: [ClaimedFlightsTab(), FindFlightsTab()],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PilotScreen extends StatefulWidget {
  const PilotScreen({Key? key}) : super(key: key);

  @override
  _PilotScreenState createState() => _PilotScreenState();
}
