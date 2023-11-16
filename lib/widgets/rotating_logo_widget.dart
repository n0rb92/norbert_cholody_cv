import 'package:flutter/material.dart';

class RotatingFlutterLogo extends StatefulWidget {
  const RotatingFlutterLogo({super.key});

  @override
  RotatingFlutterLogoState createState() => RotatingFlutterLogoState();
}

class RotatingFlutterLogoState extends State<RotatingFlutterLogo>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      child: SizedBox(
        height: 80.0,
        width: 80.0,
        child: Image.asset('images/flutter_logo.png'),
      ),
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: animationController.value *
              2.0 *
              3.1415927, // Pełny obrót (2 * π)
          child: child,
        );
      },
    );
  }
}
