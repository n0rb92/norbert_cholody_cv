import 'package:flutter/material.dart';
import 'package:norbert_cholody_cv/pages/my_story_page.dart';
import 'package:norbert_cholody_cv/widgets/footer_widget.dart';
import 'package:norbert_cholody_cv/widgets/foto_widget.dart';
import 'package:norbert_cholody_cv/widgets/wave_widget.dart';

class FirstPage extends StatelessWidget {
  final Function(String) onLocaleChange;
  const FirstPage({Key? key, required this.onLocaleChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      bottomSheet: const FooterWidget(),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Norbert Chołody curriculum vitae',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 40),
        ),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutQuad,
            top: keyboardOpen ? size.height / 10 : size.height / 5,
            child: WaveWidget(
              size: size,
              yOffset: size.height / 4,
              color: Colors.white,
            ),
          ),
          const Padding(padding: EdgeInsets.all(50), child: FotoWidget()),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: keyboardOpen ? Colors.white : Colors.transparent,
            ),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height: 500),
                const Text(
                  'CV Language:',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      letterSpacing: 1),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            onLocaleChange('en');
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const MyStoryPage()),
                            );
                          },
                          child: const Text(
                            'English',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                letterSpacing: 1),
                          )),
                      const SizedBox(width: 20),
                      ElevatedButton(
                          onPressed: () {
                            onLocaleChange('pl');
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const MyStoryPage()),
                            );
                          },
                          child: const Text(
                            'Polish',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                letterSpacing: 1),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
