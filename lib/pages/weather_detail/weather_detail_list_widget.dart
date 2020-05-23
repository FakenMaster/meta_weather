import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta_weather/model/location.dart';
import 'package:meta_weather/model/weather.dart';
import 'package:meta_weather/util/weather_icon_path.dart';

class WeatherDetailListWidget extends StatelessWidget {
  final List<Weather> weathers;
  WeatherDetailListWidget(this.weathers);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        Weather weather = weathers[index];
        return ListTile(
          leading: Image.network(
            weather.weatherStateAbbr.iconICO(),
            width: 40,
            height: 40,
          ),
          title: Text("日期:${weather.applicableDate}"),
          subtitle: Text("天气:${weather.weatherStateName}"),
        );
      },
      itemCount: weathers?.length ?? 0,
    );
  }
}
