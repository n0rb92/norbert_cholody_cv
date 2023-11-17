class WeatherModel {
  final double temperature;
  final double precipitation;
  final int humidity;
  final double pressure;
  final double windSpeed;
  final String windDirection;

  WeatherModel({
    required this.temperature,
    required this.precipitation,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.windDirection,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temperature: json['current']['temp_c'] as double,
      precipitation: json['current']['precip_mm'] as double,
      humidity: json['current']['humidity'] as int,
      pressure: json['current']['pressure_mb'] as double,
      windSpeed: json['current']['wind_kph'] as double,
      windDirection: json['current']['wind_dir'] as String,
    );
  }
}
