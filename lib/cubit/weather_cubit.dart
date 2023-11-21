import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:norbert_cholody_cv/cubit/weather_state.dart';
import 'package:norbert_cholody_cv/models/weather_api.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherApi apiClient;

  WeatherCubit(this.apiClient) : super(WeatherInitial());

  Future<void> fetchWeather(String city) async {
    try {
      emit(WeatherLoading());
      final weatherData =
          await apiClient.getWeather('1cdc7df5683447acb2e63242230304', city);
      emit(WeatherLoaded(weatherData));
    } on Exception catch (e) {
      emit(WeatherError(e.toString()));
    }
  }
}
