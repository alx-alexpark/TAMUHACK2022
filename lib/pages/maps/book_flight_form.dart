import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'dart:core';

class BookFlightForm extends StatefulWidget {
  const BookFlightForm({Key? key}) : super(key: key);

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
              data: MediaQuery.of(context).copyWith(
                  // Using 12-Hour format
                  alwaysUse24HourFormat: false),
              // If you want 24-Hour format, just change alwaysUse24HourFormat to true
              child: child!);
        });
    if (result != null) {
      setState(() {
        _selectedTime = result.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(_currentDate);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              constraints: BoxConstraints(maxWidth: size.width * 0.9),
              labelText: 'Choose an departure airpot on the map',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              constraints: BoxConstraints(maxWidth: size.width * 0.9),
              labelText: 'Choose an departure airpot on the map',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              constraints: BoxConstraints(maxWidth: size.width * 0.9),
              labelText: 'Choose an departure airpot on the map',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          CalendarCarousel<Event>(
            onDayPressed: (DateTime date, List<Event> events) {
              this.setState(() => _currentDate = date);
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Booking Flight')),
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
