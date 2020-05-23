// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
    consolidatedWeather: (json['consolidated_weather'] as List)
        ?.map((e) =>
            e == null ? null : Weather.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    time: json['time'] as String,
    sunRise: json['sun_rise'] as String,
    sunSet: json['sun_set'] as String,
    timezoneName: json['timezone_name'] as String,
    parent: json['parent'] == null
        ? null
        : Location.fromJson(json['parent'] as Map<String, dynamic>),
    sources: (json['sources'] as List)
        ?.map((e) =>
            e == null ? null : Source.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    title: json['title'] as String,
    locationType: json['location_type'] as String,
    woeid: json['woeid'] as int,
    lattLong: json['latt_long'] as String,
    timezone: json['timezone'] as String,
  );
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'consolidated_weather': instance.consolidatedWeather,
      'time': instance.time,
      'sun_rise': instance.sunRise,
      'sun_set': instance.sunSet,
      'timezone_name': instance.timezoneName,
      'parent': instance.parent,
      'sources': instance.sources,
      'title': instance.title,
      'location_type': instance.locationType,
      'woeid': instance.woeid,
      'latt_long': instance.lattLong,
      'timezone': instance.timezone,
    };
