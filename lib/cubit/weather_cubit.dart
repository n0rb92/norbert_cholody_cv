import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:norbert_cholody_cv/cubit/weather_state.dart';
import 'package:norbert_cholody_cv/models/weather_api_client.dart';
import 'package:norbert_cholody_cv/models/weather_model.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherApiClient apiClient;

  WeatherCubit(this.apiClient) : super(WeatherInitial());

  Future<void> fetchWeather(String city) async {
    try {
      emit(WeatherLoading());
      final WeatherModel weatherData = await apiClient.getWeather(city);
      emit(WeatherLoaded(weatherData));
    } on Exception catch (e) {
      emit(WeatherError(e.toString()));
    }
  }
}
