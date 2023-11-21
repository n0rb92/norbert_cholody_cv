import 'package:flutter/material.dart';
import 'package:norbert_cholody_cv/widgets/weather_widget.dart';

class MySkillsPage extends StatelessWidget {
  const MySkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text(
              'My Skills',
            ),
            SizedBox(
              width: 5,
            ),
            Icon(Icons.check)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                'API Implementation',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 250,
                width: 400,
                child: WeatherWidget(controller: TextEditingController()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
