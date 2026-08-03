import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EventType {
  FaIconData icon;
  String type;
  String imageLightPath;
  String imageDarkPath;

  EventType({
    required this.icon,
    required this.type,
    required this.imageLightPath,
    required this.imageDarkPath,
  });
}
