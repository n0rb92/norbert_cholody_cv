import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:norbert_cholody_cv/cubit/theme_cubit.dart';
import 'package:norbert_cholody_cv/main.dart';
import 'package:norbert_cholody_cv/pages/my_skills.dart';
import 'package:norbert_cholody_cv/widgets/foto_widget.dart';
import 'package:norbert_cholody_cv/widgets/rotating_logo_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  Future<void> _copyEmailToClipboard(String message) async {
    await Clipboard.setData(const ClipboardData(text: 'norbert@alno3d.pl'));

    messengerKey.currentState?.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Row(
          children: <Widget>[
            Text(message),
            const SizedBox(width: 5),
            const Icon(Icons.check, color: Colors.white),
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
              title: Text(AppLocalizations.of(context)!.themeChange),
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
                child: Text(AppLocalizations.of(context)!.mySkills)),
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
              child: Text(AppLocalizations.of(context)!.myGitHub),
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
                child: Text(AppLocalizations.of(context)!.myGooglePlay))
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
            Text(
              AppLocalizations.of(context)!.myHistory,
              style: const TextStyle(
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
                  const FotoWidget(),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () => _copyEmailToClipboard(
                        AppLocalizations.of(context)!.emailCopied),
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
                    Text(
                      AppLocalizations.of(context)!.himyNameIs,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      AppLocalizations.of(context)!.wantToTellYou,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.paragraph1,
                      style: const TextStyle(fontSize: 20),
                    ),
                    Divider(
                      height: 20,
                      thickness: 3,
                      color: Theme.of(context).dividerColor,
                    ),
                    Text(
                      AppLocalizations.of(context)!.paragraph2,
                      style: const TextStyle(fontSize: 20),
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
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () => showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              child: AspectRatio(
                                aspectRatio: 0.3,
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Image.asset('images/model_gif.gif'),
                                ),
                              ),
                            ),
                          ),
                          child: const Text(
                            "GIF",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        ElevatedButton(
                          onPressed: () => showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              child: AspectRatio(
                                aspectRatio: 0.3,
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child:
                                      Image.asset('images/model_pubspec.png'),
                                ),
                              ),
                            ),
                          ),
                          child: const Text(
                            "Pubspec",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 20,
                      thickness: 3,
                      color: Theme.of(context).dividerColor,
                    ),
                    Text(
                      AppLocalizations.of(context)!.paragraph3,
                      style: const TextStyle(fontSize: 20),
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
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () => showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              child: AspectRatio(
                                aspectRatio: 0.3,
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Image.asset('images/alno_gif.gif'),
                                ),
                              ),
                            ),
                          ),
                          child: const Text(
                            "GIF",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        ElevatedButton(
                          onPressed: () => showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              child: AspectRatio(
                                aspectRatio: 0.3,
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Image.asset('images/alno_pubspec.png'),
                                ),
                              ),
                            ),
                          ),
                          child: const Text(
                            "Pubspec",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 20,
                      thickness: 3,
                      color: Theme.of(context).dividerColor,
                    ),
                    Text(AppLocalizations.of(context)!.paragraph4,
                        style: const TextStyle(fontSize: 20)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.alno3D,
                      style: const TextStyle(fontSize: 20),
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
