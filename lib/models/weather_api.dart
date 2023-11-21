import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:norbert_cholody_cv/models/weather_model.dart';

part 'weather_api.g.dart';

@RestApi(baseUrl: "http://api.weatherapi.com/v1")
abstract class WeatherApi {
  factory WeatherApi(Dio dio, {String baseUrl}) = _WeatherApi;

  @GET("/current.json")
  Future<WeatherModel> getWeather(
    @Query("key") String apiKey,
    @Query("q") String city,
  );
}
