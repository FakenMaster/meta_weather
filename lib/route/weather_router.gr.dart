// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:meta_weather/pages/search_location/search_location_widget.dart';
import 'package:meta_weather/pages/weather_detail/weather_detail_widget.dart';
import 'package:meta_weather/model/location.dart';

abstract class Routes {
  static const searchLocationWidget = '/';
  static const weatherDetailWidget = '/weather-detail-widget';
  static const all = {
    searchLocationWidget,
    weatherDetailWidget,
  };
}

class WeatherRouter extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<WeatherRouter>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.searchLocationWidget:
        return MaterialPageRoute<dynamic>(
          builder: (context) => SearchLocationWidget(),
          settings: settings,
        );
      case Routes.weatherDetailWidget:
        if (hasInvalidArgs<WeatherDetailWidgetArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<WeatherDetailWidgetArguments>(args);
        }
        final typedArgs = args as WeatherDetailWidgetArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => WeatherDetailWidget(typedArgs.location),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//WeatherDetailWidget arguments holder class
class WeatherDetailWidgetArguments {
  final Location location;
  WeatherDetailWidgetArguments({@required this.location});
}
