import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  static const String collectionName = 'Events';

  String id;
  String eventName;
  String imagePathLight;
  String imagePathDark;
  int eventIndex;
  String title;
  String description;
  DateTime eventDate;
  bool isFavourite;

  Event({
    this.id = '',
    required this.eventName,
    required this.imagePathLight,
    required this.imagePathDark,
    required this.eventIndex,
    required this.title,
    required this.description,
    required this.eventDate,
    this.isFavourite = false
  });

  Event.fromJson(Map<String, dynamic>json) :
        this(
          id: json["id"] as String,
          eventName: json["Event_Name"] as String,
          imagePathLight: json["Image_Path_Light"] as String,
          imagePathDark: json["Image_PAth_Dark"] as String,
          eventIndex: json["Event_Index"] as int,
          title: json["Title"] as String,
          description: json["Description"] as String,
          eventDate: (json["Event_Date"] as Timestamp).toDate(),
          isFavourite: json["Is_Favourite"] as bool
      );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "Event_Name": eventName,
      "Image_Path_Light": imagePathLight,
      "Image_PAth_Dark": imagePathDark,
      "Event_Index": eventIndex,
      "Title": title,
      "Description": description,
      "Event_Date": eventDate,
      "Is_Favourite": isFavourite
    };
  }
}