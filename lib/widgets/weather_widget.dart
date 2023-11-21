import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:norbert_cholody_cv/cubit/weather_cubit.dart';
import 'package:norbert_cholody_cv/cubit/weather_state.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: 'Enter City Name, to know actually weather',
              suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    context.read<WeatherCubit>().fetchWeather(controller.text);
                  }),
            ),
          ),
          const SizedBox(height: 20),
          BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              if (state is WeatherLoading) {
                return const CircularProgressIndicator();
              } else if (state is WeatherLoaded) {
                final weather = state.weatherData;
                return Column(
                  children: [
                    Text('Temperature: ${weather.temperature} °C'),
                    Text('Precipitation: ${weather.precipitation} mm'),
                    Text('Humidity: ${weather.humidity}%'),
                    Text('Pressure: ${weather.pressure} mb'),
                    Text(
                        'Wind: ${weather.windSpeed} kph, ${weather.windDirection}'),
                  ],
                );
              } else if (state is WeatherError) {
                return Text(state.message);
              } else {
                return const Text(
                    'Enter a city name to get weather information');
              }
            },
          )
        ],
      ),
    );
  }
}
