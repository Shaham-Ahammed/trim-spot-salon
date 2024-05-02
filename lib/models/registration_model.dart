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
  List<Timestamp> occasionalClosures;
  String parsedOpeningTime;

  String parsedClosingTime;
  List<String> holidays;
  String password;
  bool isApproved;
  bool isRejected;

  RegistraitonModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.shopName,
    required this.shopLocationLatLng,
    required this.shopLocationName,
    required this.shopLicenseImage,
    required this.occasionalClosures,
    required this.profileImage,
    required this.shopImage,
    required this.services,
    required this.parsedOpeningTime,
    required this.parsedClosingTime,
    required this.holidays,
    required this.password,
    required this.isApproved,
    required this.isRejected,
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
      "parsedOpeningTime": parsedOpeningTime,
      "parsedClosingTime": parsedClosingTime,
      "holidays": holidays,
      "password": password,
      "isApproved": isApproved,
      "isRejected": isRejected,
      "occasionalClosures":occasionalClosures
    };
  }
}
