import 'package:flutter/material.dart';

class PilotTab extends StatelessWidget {
  final bool selected;
  final String title;

  PilotTab({required this.selected, required this.title, Key? key});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: selected ? Color(0xFF5F4AD8) : Colors.transparent,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              color: selected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
