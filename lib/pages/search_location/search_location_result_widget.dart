import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta_weather/model/location.dart';
import 'package:meta_weather/route/weather_router.gr.dart';

class SearchLocationResultWidget extends StatelessWidget {
  final List<Location> locations;
  SearchLocationResultWidget(this.locations);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final location = locations[index];

        return InkWell(
          onTap: () {
            ExtendedNavigator.of(context).pushNamed(Routes.weatherDetailWidget,
                arguments: WeatherDetailWidgetArguments(location: location));
          },
          child: Container(
            alignment: FractionalOffset.center,
            margin: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                          top: 6.0,
                          bottom: 4.0,
                        ),
                        child: Text(
                          "${location.title}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "${location.lattLong}",
                          style: TextStyle(
                            fontFamily: "Hind",
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
      itemCount: locations.length,
    );
  }
}
