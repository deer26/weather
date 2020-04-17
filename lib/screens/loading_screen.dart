import 'package:climate/screens/location_screen.dart';
import 'package:climate/services/weather.dart';
import 'package:climate/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Konum Pilizz🦅",
            style: kMessageTextStyle,),
            SpinKitDoubleBounce(
              color: Colors.white,
              size: 100.0,
            ),
          ],
        ),
      ),
    );
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    print(weatherData);

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => LocationScreen(weatherData)));
  }
}
