import 'package:flutter/material.dart';
import 'package:norbert_cholody_cv/widgets/map_widget.dart';
import 'package:norbert_cholody_cv/widgets/weather_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MySkillsPage extends StatelessWidget {
  const MySkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              AppLocalizations.of(context)!.mySkills,
            ),
            const SizedBox(
              width: 5,
            ),
            const Icon(Icons.check)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: Column(
                  children: [
                    SkillItem(title: '- Dart', image: 'images/dart_logo.png'),
                    SizedBox(height: 5),
                    SkillItem(
                        title: '- Flutter', image: 'images/flutter_logo.png'),
                    SizedBox(height: 5),
                    SkillItem(
                        title: '- Bloc/ Cubit', image: 'images/bloc_logo.png'),
                    SizedBox(height: 5),
                    SkillItem(
                        title: '- Firebase', image: 'images/firebase.png'),
                    SizedBox(height: 5),
                    SkillItem(title: '- GitHub', image: 'images/git_logo.png'),
                    SizedBox(height: 5),
                    SkillItem(
                      title: '''
                    - Get_it

                     - Injectable

                     - Dio

                      - Retrofit
                        
                      - CI/CD with CodeMagic

                     - Google mobile ads
                      ''',
                      image: null,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.apiImplementation,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 250,
                      width: 400,
                      child: WeatherWidget(controller: TextEditingController()),
                    ),
                    Text(
                      AppLocalizations.of(context)!.yourLocation,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 300,
                      width: 300,
                      child: MapImageWidget(),
                    )
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

class SkillItem extends StatelessWidget {
  final String title;
  final String? image;

  const SkillItem({Key? key, required this.title, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        if (image != null)
          Image(
            image: AssetImage(image!),
            height: 50,
            width: 50,
          ),
      ],
    );
  }
}
