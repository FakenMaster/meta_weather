part of 'weather_bloc.dart';

abstract class WeatherDetailState extends Equatable {
  const WeatherDetailState();
}

class WeatherLoadingState extends WeatherDetailState {
  @override
  List<Object> get props => [];
}

class WeatherResultState extends WeatherDetailState {
  final Location result;
  WeatherResultState(this.result);
  @override
  List<Object> get props => [result];
}

class WeatherErrorState extends WeatherDetailState {
  @override
  List<Object> get props => [];
}
