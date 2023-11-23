import 'dart:math';

import 'package:flutter/material.dart';

class FotoWidget extends StatefulWidget {
  const FotoWidget({super.key});

  @override
  FotoWidgetState createState() => FotoWidgetState();
}

class FotoWidgetState extends State<FotoWidget> {
  late String selectedImage;
  List<String> images = [
    'images/foto/1.jpg',
    'images/foto/2.jpg',
    'images/foto/3.jpg',
    'images/foto/4.jpg',
    'images/foto/5.jpg',
  ];

  @override
  void initState() {
    super.initState();
    selectedImage = images[Random().nextInt(images.length)];
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: AssetImage(selectedImage),
      maxRadius: 150,
    );
  }
}
