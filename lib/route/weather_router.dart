import 'package:auto_route/auto_route_annotations.dart';
import 'package:meta_weather/pages/search_location/search_location_widget.dart';
import 'package:meta_weather/pages/weather_detail/weather_detail_widget.dart';

@MaterialAutoRouter()
class $WeatherRouter {
  @initial
  SearchLocationWidget searchLocationWidget;

  WeatherDetailWidget weatherDetailWidget;
}
