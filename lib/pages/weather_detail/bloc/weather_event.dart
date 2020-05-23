part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class WeatherLoadEvent extends WeatherEvent {
  final int woeid;
  WeatherLoadEvent(this.woeid);
  @override
  List<Object> get props => [];
}
