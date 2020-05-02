import 'package:flutter/material.dart';

class MaxandMinTemperatureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Maximum: " + 24.toString() + " C",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "Minimum: " + 20.toString() + " C",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
