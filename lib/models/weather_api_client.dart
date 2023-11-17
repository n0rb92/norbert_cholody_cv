import 'package:dio/dio.dart';
import 'package:norbert_cholody_cv/models/weather_model.dart';

class WeatherApiClient {
  final Dio _dio = Dio();
  final String _apiKey = '1cdc7df5683447acb2e63242230304';

  Future<WeatherModel> getWeather(String city) async {
    try {
      final response = await _dio.get(
        'http://api.weatherapi.com/v1/current.json',
        queryParameters: {
          'key': _apiKey,
          'q': city,
        },
      );
      return WeatherModel.fromJson(response.data);
    } on DioException catch (dioError) {
      if (dioError.response?.statusCode == 400) {
        throw Exception('City name error');
      } else {
        throw Exception('DioError: ${dioError.message}');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}
