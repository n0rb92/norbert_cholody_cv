import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:norbert_cholody_cv/cubit/theme_cubit.dart';
import 'package:norbert_cholody_cv/cubit/weather_cubit.dart';
import 'package:norbert_cholody_cv/models/weather_api_client.dart';
import 'package:norbert_cholody_cv/pages/first_page.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider<WeatherCubit>(
            create: (context) => WeatherCubit(WeatherApiClient()))
      ],
      child: const MyCVApp(),
    ),
  );
}

class MyCVApp extends StatelessWidget {
  const MyCVApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Norbert Chołody CV',
          theme: theme,
          home: const FirstPage(),
        );
      },
    );
  }
}
