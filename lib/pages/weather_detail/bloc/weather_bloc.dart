import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta_weather/model/location.dart';
import 'package:meta_weather/service/http.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherDetailState> {
  @override
  WeatherDetailState get initialState => WeatherLoadingState();

  @override
  Stream<WeatherDetailState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is WeatherLoadEvent) {
      yield WeatherLoadingState();
      yield* _getWeatherDetail(event.woeid);
    }
  }

  Stream<WeatherDetailState> _getWeatherDetail(int woeid) async* {
    var result = await Http.getInstance().getWeather(woeid);
    if (result == null) {
      yield WeatherErrorState();
    } else {
      yield WeatherResultState(result);
    }
  }
}
