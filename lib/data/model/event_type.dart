import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
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

  static List<EventType> getCategories(BuildContext context) {
    return [
      EventType(
        icon: FontAwesomeIcons.compass,
        type: AppLocalizations.of(context)!.all,
        imageLightPath: "",
        imageDarkPath: "",
      ),
      EventType(
        icon: FontAwesomeIcons.bicycle,
        type: AppLocalizations.of(context)!.sport,
        imageLightPath: AppAssets.sportLight,
        imageDarkPath: AppAssets.sportDark,
      ),
      EventType(
        icon: FontAwesomeIcons.bookOpen,
        type: AppLocalizations.of(context)!.bookClub,
        imageLightPath: AppAssets.bookClubLight,
        imageDarkPath: AppAssets.bookClubDark,
      ),
      EventType(
        icon: FontAwesomeIcons.cakeCandles,
        type: AppLocalizations.of(context)!.birthDay,
        imageLightPath: AppAssets.birthDayLight,
        imageDarkPath: AppAssets.birthDayDark,
      ),
      EventType(
        icon: FontAwesomeIcons.meetup,
        type: AppLocalizations.of(context)!.meeting,
        imageLightPath: AppAssets.meetingLight,
        imageDarkPath: AppAssets.meetingDark,
      ),
      EventType(
        icon: FontAwesomeIcons.images,
        type: AppLocalizations.of(context)!.exhibition,
        imageLightPath: AppAssets.exhibitionLight,
        imageDarkPath: AppAssets.exhibitionDark,
      ),
    ];
  }
}
