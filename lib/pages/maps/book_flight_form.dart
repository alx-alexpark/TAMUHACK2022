import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:tamuhack2022/pages/bottom_bar.dart';
import 'dart:core';

import 'package:tamuhack2022/pages/dashboard.dart';

class BookFlightForm extends StatefulWidget {
  final Function onDepartTap;
  final Function onArrivalTap;
  final TextEditingController arrivalInputController;
  final TextEditingController departInputController;
  final Function onDateChange;
  final Function onTimeChange;
  final Future<void> Function() submit;

  const BookFlightForm({
    Key? key,
    required this.onDepartTap,
    required this.onArrivalTap,
    required this.arrivalInputController,
    required this.departInputController,
    required this.onDateChange,
    required this.onTimeChange,
    required this.submit,
  }) : super(key: key);

  @override
  _BookFlightFormState createState() => _BookFlightFormState();
}

class _BookFlightFormState extends State<BookFlightForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime _currentDate = DateTime.now();
  String? _selectedTime;

  Future<void> _show() async {
    final TimeOfDay? result = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return MediaQuery(
              data:
                  MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
              child: child!);
        });
    if (result != null) {
      widget.onTimeChange(result);
      setState(() {
        _selectedTime = result.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: widget.departInputController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              constraints: BoxConstraints(maxWidth: size.width * 0.9),
              labelText: 'Choose an departure airpot on the map',
            ),
            onTap: () {
              widget.onDepartTap();
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: widget.arrivalInputController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              constraints: BoxConstraints(maxWidth: size.width * 0.9),
              labelText: 'Choose an arrival airpot on the map',
            ),
            onTap: () {
              widget.onArrivalTap();
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          CalendarCarousel<Event>(
            onDayPressed: (DateTime date, List<Event> events) {
              setState(() {
                _currentDate = date;
              });
              widget.onDateChange(date);
            },
            weekendTextStyle: TextStyle(
              color: Colors.red,
            ),
            thisMonthDayBorderColor: Colors.grey,
            customDayBuilder: (
              bool isSelectable,
              int index,
              bool isSelectedDay,
              bool isToday,
              bool isPrevMonthDay,
              TextStyle textStyle,
              bool isNextMonthDay,
              bool isThisMonthDay,
              DateTime day,
            ) {
              return null;
            },
            weekFormat: false,
            markedDateIconMaxShown: 1,
            height: 480.0,
            selectedDateTime: _currentDate,
            daysHaveCircularBorder: false,
          ),
          Align(
            alignment: Alignment.center,
            child: TextButton(
              style: TextButton.styleFrom(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                backgroundColor: Color(0xFF5F4AD8),
                primary: Colors.white,
                textStyle: TextStyle(
                  fontFamily: "Geometria",
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: _show,
              child: Text("Pick a time"),
            ),
          ),
          Container(
            width: size.width,
            height: size.height * 0.15,
            child: Align(
              alignment: Alignment.center,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(10.0),
                  backgroundColor: Color(0xFF5F4AD8),
                  primary: Colors.white,
                  textStyle: TextStyle(
                    fontFamily: "Geometria",
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Booking Flight')),
                    );
                    await widget.submit();

                    ScaffoldMessenger.of(context).removeCurrentSnackBar();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomBarWidget(),
                      ),
                    );
                  }
                },
                child: Text("Submit"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
