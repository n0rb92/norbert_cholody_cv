// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import 'package:flutter/material.dart';
import 'package:norbert_cholody_cv/config.dart';

class MapImageWidget extends StatefulWidget {
  const MapImageWidget({super.key});

  @override
  MapImageWidgetState createState() => MapImageWidgetState();
}

String generateMapImageUrl(String latitude, String longitude) {
  return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=14&size=300x300&key=$apiKey';
}

class MapImageWidgetState extends State<MapImageWidget> {
  String? mapImageUrl;

  @override
  void initState() {
    super.initState();
    js.context.callMethod('getLocation');
    Future.delayed(const Duration(seconds: 5), () {
      String locationData = js.context['locationData'].toString();
      List<String> latLng = locationData.split(',');
      setState(() {
        mapImageUrl = generateMapImageUrl(latLng[0], latLng[1]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return mapImageUrl == null
        ? const CircularProgressIndicator()
        : Image.network(mapImageUrl!);
  }
}
