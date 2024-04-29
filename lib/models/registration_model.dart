import 'package:cloud_firestore/cloud_firestore.dart';

class RegistraitonModel {
  String name;
  String email;
  String phone;
  String shopName;
  GeoPoint shopLocationLatLng;
  String shopLocationName;
  String shopLicenseImage;
  String profileImage;
  String shopImage;
  Map<String, Map<String, String>> services;
  DateTime openingTime;
  String parsedOpeningTime;
  DateTime closingTime;
  String parsedClosingTime;
  List<String> holidays;
  String password;
  bool isApproved;
  bool isRejected;
  Map<String,Map<String,int>> reviewsAndRatings;

  RegistraitonModel(
      {required this.name,
      required this.email,
      required this.phone,
      required this.shopName,
      required this.shopLocationLatLng,
      required this.shopLocationName,
      required this.shopLicenseImage,
      required this.profileImage,
      required this.shopImage,
      required this.services,
      required this.openingTime,
      required this.parsedOpeningTime,
      required this.closingTime,
      required this.parsedClosingTime,
      required this.holidays,
      required this.password,
      required this.isApproved,
      required this.isRejected,
      required this.reviewsAndRatings,
      });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "shopName": shopName,
      "locationLatLng": shopLocationLatLng,
      "locationName": shopLocationName,
      "licenseImage": shopLicenseImage,
      "profileImage": profileImage,
      "shopImage": shopImage,
      "services": services,
      "openingTime": openingTime,
      "parsedOpeningTime": parsedOpeningTime,
      "closingTime": closingTime,
      "parsedClosingTime": parsedClosingTime,
      "holidays": holidays,
      "password": password,
      "isApproved": isApproved,
      "isRejected": isRejected,
      "reviewsAndRatings":reviewsAndRatings

    };
  }
}
