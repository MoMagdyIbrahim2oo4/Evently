import 'package:evently/core/constants/app_assets.dart';
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

  static List<EventType> getCategories() {
    return [
      EventType(
        icon: FontAwesomeIcons.compass,
        type: "All",
        imageLightPath: "",
        imageDarkPath: "",
      ),
      EventType(
        icon: FontAwesomeIcons.bicycle,
        type: "Sport",
        imageLightPath: AppAssets.sportLight,
        imageDarkPath: AppAssets.sportDark,
      ),
      EventType(
        icon: FontAwesomeIcons.bookOpen,
        type: "Book Club",
        imageLightPath: AppAssets.bookClubLight,
        imageDarkPath: AppAssets.bookClubDark,
      ),
      EventType(
        icon: FontAwesomeIcons.cakeCandles,
        type: "BirthDay",
        imageLightPath: AppAssets.birthDayLight,
        imageDarkPath: AppAssets.bookClubDark,
      ),
      EventType(
        icon: FontAwesomeIcons.meetup,
        type: "Meeting",
        imageLightPath: AppAssets.meetingLight,
        imageDarkPath: AppAssets.meetingDark,
      ),
      EventType(
        icon: FontAwesomeIcons.images,
        type: "Exhibition",
        imageLightPath: AppAssets.exhibitionLight,
        imageDarkPath: AppAssets.exhibitionDark,
      ),
    ];
  }
}
