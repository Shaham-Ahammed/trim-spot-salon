class ShopUpdationModel {
  String shopImage;
  Map<String, Map<String, String>> services;
  List<String> occasionalClosures;
  String parsedOpeningTime;
  String parsedClosingTime;
  List<String> holidays;
  List<String> servicesList;
  
  ShopUpdationModel({
    required this.shopImage,
    required this.services,
    required this.occasionalClosures,
    required this.parsedOpeningTime,
    required this.parsedClosingTime,
    required this.servicesList,
    required this.holidays,
  });

  Map<String, dynamic> toMap() {
    return {
      "shopImage": shopImage,
      "services": services,
      "parsedOpeningTime": parsedOpeningTime,
      "parsedClosingTime": parsedClosingTime,
      "holidays": holidays,
      "occasionalClosures": occasionalClosures,
      "servicesList":servicesList
    };
  }
}
