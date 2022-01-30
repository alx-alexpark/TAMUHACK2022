import 'package:flutter/material.dart';

class BookFlightForm extends StatefulWidget {
  const BookFlightForm({Key? key}) : super(key: key);

  @override
  _BookFlightFormState createState() => _BookFlightFormState();
}

class _BookFlightFormState extends State<BookFlightForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
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
          )
        ],
      ),
    );
  }
}
