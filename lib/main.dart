import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:norbert_cholody_cv/cubit/theme_cubit.dart';
import 'package:norbert_cholody_cv/cubit/weather_cubit.dart';
import 'package:norbert_cholody_cv/models/weather_api.dart';
import 'package:norbert_cholody_cv/pages/first_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyCVApp());
}

final GlobalKey<ScaffoldMessengerState> messengerKey =
    GlobalKey<ScaffoldMessengerState>();

class MyCVApp extends StatelessWidget {
  const MyCVApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherCubit>(
          create: (context) => WeatherCubit(WeatherApi(Dio())),
        ),
        BlocProvider<ThemeCubit>(
          create: (_) => ThemeCubit(),
        ),
      ],
      child: const MyCV(),
    );
  }
}

class MyCV extends StatefulWidget {
  const MyCV({super.key});

  @override
  MyCVState createState() => MyCVState();
}

class MyCVState extends State<MyCV> {
  Locale _locale = const Locale('en');

  void _setLocale(String lang) {
    setState(() {
      _locale = Locale(lang);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, themeData) {
        return MaterialApp(
          scaffoldMessengerKey: messengerKey,
          locale: _locale,
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
          theme: themeData,
          home: FirstPage(onLocaleChange: _setLocale),
        );
      },
    );
  }
}
