import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:norbert_cholody_cv/cubit/weather_cubit.dart';
import 'package:norbert_cholody_cv/cubit/weather_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              labelText: AppLocalizations.of(context)!.weatherWidget,
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
                    Text(
                        '${AppLocalizations.of(context)!.temp} ${weather.temperature} °C'),
                    Text(
                        '${AppLocalizations.of(context)!.prec} ${weather.precipitation} mm'),
                    Text(
                        '${AppLocalizations.of(context)!.hum} ${weather.humidity}%'),
                    Text(
                        '${AppLocalizations.of(context)!.press} ${weather.pressure} mb'),
                    Text(
                        '${AppLocalizations.of(context)!.wind} ${weather.windSpeed} km/h, ${weather.windDirection}'),
                  ],
                );
              } else if (state is WeatherError) {
                return Text(state.message);
              } else {
                return Text(AppLocalizations.of(context)!.weatherWidget);
              }
            },
          )
        ],
      ),
    );
  }
}
