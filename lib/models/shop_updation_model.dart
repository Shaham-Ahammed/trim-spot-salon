import 'package:cloud_firestore/cloud_firestore.dart';

class ShopUpdationModel {
  String shopName;
  String shopImage;
//  List<Map<String, Map<String, String>>> services;
  List<Timestamp> occasionalClosures;
  String parsedOpeningTime;
  String parsedClosingTime;
  List<String> holidays;

  ShopUpdationModel({
    required this.shopName,
    required this.shopImage,
   // required this.services,
    required this.occasionalClosures,
    required this.parsedOpeningTime,
    required this.parsedClosingTime,
    required this.holidays,
  });

  Map<String, dynamic> toMap() {
    return {
      "shopName": shopName,
      "shopImage": shopImage,
    //  "services": services,
      "parsedOpeningTime": parsedOpeningTime,
      "parsedClosingTime": parsedClosingTime,
      "holidays": holidays,
      "occasionalClosures": occasionalClosures
    };
  }
}
