import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:norbert_cholody_cv/cubit/theme_cubit.dart';
import 'package:norbert_cholody_cv/cubit/weather_cubit.dart';
import 'package:norbert_cholody_cv/models/weather_api.dart';
import 'package:norbert_cholody_cv/pages/first_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider<WeatherCubit>(
            create: (context) => WeatherCubit(WeatherApi(Dio()))),
      ],
      child: const MyCVApp(),
    ),
  );
}

class MyCVApp extends StatefulWidget {
  const MyCVApp({Key? key}) : super(key: key);

  @override
  MyCVAppState createState() => MyCVAppState();
}

class MyCVAppState extends State<MyCVApp> {
  Locale locale = const Locale('en');

  void _setLocale(String lang) {
    setState(() {
      locale = Locale(lang);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('pl'),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Norbert Chołody CV',
      theme: BlocProvider.of<ThemeCubit>(context).state,
      home: FirstPage(onLocaleChange: _setLocale),
    );
  }
}
