import 'package:flutter/material.dart';

import 'last_update.dart';
import 'location.dart';
import 'max_min_temp.dart';
import 'select_city.dart';
import 'weather_picture.dart';

class WeatherApp extends StatelessWidget {
  String selectedCityFromUser = "Antalya";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                selectedCityFromUser = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SelectCityWidget(),
                  ),
                );
              }),
        ],
        title: Text("Weather App"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: LocationWidget(
                selectedCity: selectedCityFromUser,
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: LastUpdateWidget()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: WeatherPictureWidget()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: MaxandMinTemperatureWidget()),
            ),
          ],
        ),
      ),
    );
  }
}
