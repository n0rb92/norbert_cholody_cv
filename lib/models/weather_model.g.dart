// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) {
  return WeatherModel(
    temperature: json['current']['temp_c'] as double?,
    precipitation: json['current']['precip_mm'] as double?,
    humidity: json['current']['humidity'] as int?,
    pressure: json['current']['pressure_mb'] as double?,
    windSpeed: json['current']['wind_kph'] as double?,
    windDirection: json['current']['wind_dir'] as String?,
  );
}

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'temperature': instance.temperature,
      'precipitation': instance.precipitation,
      'humidity': instance.humidity,
      'pressure': instance.pressure,
      'windSpeed': instance.windSpeed,
      'windDirection': instance.windDirection,
    };
