import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:norbert_cholody_cv/cubit/theme_cubit.dart';
import 'package:norbert_cholody_cv/pages/my_skills.dart';
import 'package:norbert_cholody_cv/widgets/rotating_logo_widget.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse(
    'https://play.google.com/store/apps/details?id=com.norbertcholody.kolekcja_hw');
final Uri _url2 = Uri.parse(
    'https://play.google.com/store/apps/details?id=com.norbertcholody.filaments_warehouse');
final Uri _url3 = Uri.parse('https://alno3d.pl');
final Uri _url4 = Uri.parse('https://github.com/n0rb92?tab=repositories');
final Uri _url5 = Uri.parse(
    'https://play.google.com/store/apps/developer?id=Norbert+Chołody+ALNO+3D');

class MyStoryPage extends StatelessWidget {
  const MyStoryPage({super.key});

  Future<void> _copyEmailToClipboard(BuildContext context) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    await Clipboard.setData(const ClipboardData(text: 'norbert@alno3d.pl'));

    scaffoldMessenger.showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Row(
          children: <Widget>[
            Text('Adres e-mail skopiowany do schowka.'),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.check,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(child: RotatingFlutterLogo()),
            ListTile(
              title: const Text('Zmień Motyw'),
              trailing: Switch(
                value: context.watch<ThemeCubit>().state.brightness ==
                    Brightness.dark,
                onChanged: (bool newValue) {
                  context.read<ThemeCubit>().toggleTheme();
                },
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(30, 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const MySkillsPage()),
                  );
                },
                child: const Text('My skills')),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(30, 25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              onPressed: () {
                _launchUrl4();
              },
              child: const Text('My Github'),
            ),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(30, 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
                onPressed: () {
                  _launchUrl5();
                },
                child: const Text('My Google Play Apps'))
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back),
              tooltip: 'Wróć',
            ),
            const Text(
              "Moja Historia z Flutter",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('images/foto.jpg'),
                    radius: 120,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () => _copyEmailToClipboard(context),
                    child: const Text(
                      textAlign: TextAlign.center,
                      'norbert@alno3d.pl',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Tel. +48-782-510-980',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )
                ],
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Cześć, nazywam się Norbert Chołody.",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Chcę ci opowiedzieć moją jeszcze krótką ale intensywną przygodę z programowaniem we Flutter.',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'W grudniu 2022 roku na facebooku wyświetliła mi się reklama Adama Smaki, który zachęcał do poznania fajnej technologii, dzięki której możemy nauczyć się tworzyć własne aplikacje mobilne, wydało mi się to ciekawe i zapisałem się na webinar na, którym w ciągu godziny przedstawił fluttera w sposób, który niesamowicie mnie zainteresował i szybko podjąłem decyzję o rozpoczęciu nauki. Od stycznia 2023 roku rozpocząłem naukę, która sprawia mi niesamowitą frajdę. Oprócz nauki z kursu Adama, uczę się także od "Flutter Mapp" i "Flutter Athletes Poland".',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'W lipcu 2023 roku, po pół roku intensywnej nauki podjąłem decyzję by zacząć tworzyć swoją pierwszą własną aplikację, którą stworzę sam od początku do końca, Aplikacja ta skierowana jest dla kolekcjonerów modeli samochodów firm hot Wheels i Matchbox, które sam także kolekcionuję dzięki czemu sam jestem aktywnym użytkownikiem swojej aplikacji, jest ona dostępna w sklepie Play a jej nazwa to "Model Maniacs", dostępna jest w 7 językach i oparta jest o Firebase. Aplikacja ukazała się 29 sierpnia, i od tamtej pory dostała 4 aktualizacje.',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        _launchUrl();
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage('images/play.png'),
                            height: 50,
                            width: 50,
                          ),
                          Padding(
                            padding: EdgeInsets.all(13.0),
                            child: Text(
                              'Model Maniacs',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Po opublikowaniu Model Maniacs, postanowiłem zacząć tworzyć aplikację, która jako pierwsza była w moich myślach lecz nie czułem się na siłach jeszcze do tej pory, a mianowicie aplikację dla firm i prywatnych użytkowników drukarek 3D. Ponieważ sam od 2021 roku prowadzę małą firmę zajmującą się drukiem 3D, wpadłem na pomysł stworzenia aplikacji, w której będziemy mogli prowadzić nasz magazyn filamentów do druku a takżę bazę drukarek i tworzyć historię wydruków, która będzię uwzględniać zużycie filamentów. Po nieco ponad dwóch miesiącach intensywnej pracy udało mi się opublikować moją aplikację o nazwie ALNO 3D Filaments Warehouse, która równierz oparta jest o Firebase a także, zastosowałem w niej zarządzanie stanem za pomocą Bloc Cubit.',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        _launchUrl2();
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage('images/play.png'),
                            height: 50,
                            width: 50,
                          ),
                          Padding(
                            padding: EdgeInsets.all(13.0),
                            child: Text(
                              'ALNO 3D Filaments Warehouse',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                        'W obecnej chwili pracuję nad swoją trzecią aplikacją a także, szukam pracy jako programista flutter aby codziennie móc uczyć się od profesionalistów i brać udział w projektach komercyjnych.',
                        style: TextStyle(fontSize: 20)),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'ALNO 3D to firma zajmująca się drukiem 3D a także pod tą marką wydałem obie swoje aplikacje.',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        _launchUrl3();
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage('images/alno.png'),
                            height: 300,
                            width: 300,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

Future<void> _launchUrl2() async {
  if (!await launchUrl(_url2)) {
    throw Exception('Could not launch $_url2');
  }
}

Future<void> _launchUrl3() async {
  if (!await launchUrl(_url3)) {
    throw Exception('Could not launch $_url3');
  }
}

Future<void> _launchUrl4() async {
  if (!await launchUrl(_url4)) {
    throw Exception('Could not launch $_url4');
  }
}

Future<void> _launchUrl5() async {
  if (!await launchUrl(_url5)) {
    throw Exception('Could not launch $_url4');
  }
}
