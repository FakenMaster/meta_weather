import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meta_weather/route/weather_router.gr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: (context, nativeNavigator) => Theme(
          data: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          child: ExtendedNavigator<WeatherRouter>(
            router: WeatherRouter(),
          )),
    );
  }
}
