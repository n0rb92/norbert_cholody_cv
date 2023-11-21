import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  double? temperature;
  double? precipitation;
  int? humidity;
  double? pressure;
  double? windSpeed;
  String? windDirection;

  WeatherModel({
    this.temperature,
    this.precipitation,
    this.humidity,
    this.pressure,
    this.windSpeed,
    this.windDirection,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
}
