import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  int id;
  @JsonKey(name: 'weather_state_name')
  String weatherStateName;
  @JsonKey(name: 'weather_state_abbr')
  String weatherStateAbbr;
  @JsonKey(name: 'wind_direction_compass')
  String windDirectionCompass;
  String created;
  @JsonKey(name: 'applicable_date')
  String applicableDate;
  @JsonKey(name: 'min_temp')
  double minTemp;
  @JsonKey(name: 'max_temp')
  double maxTemp;
  @JsonKey(name: 'the_temp')
  double theTemp;
  @JsonKey(name: 'wind_speed')
  double windSpeed;
  @JsonKey(name: 'wind_direction')
  double windDirection;
  @JsonKey(name: 'air_pressure')
  double airPressure;
  int humidity;
  double visibility;
  int predictability;

  Weather({
    this.id,
    this.weatherStateName,
    this.weatherStateAbbr,
    this.windDirectionCompass,
    this.created,
    this.applicableDate,
    this.minTemp,
    this.maxTemp,
    this.theTemp,
    this.windSpeed,
    this.windDirection,
    this.airPressure,
    this.humidity,
    this.visibility,
    this.predictability,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
