class ShopUpdationModel {
  String shopImage;
  Map<String, Map<String, String>> services;
  List<String> occasionalClosures;
  List<String> servicesList;
  ShopUpdationModel({
    required this.shopImage,
    required this.services,
    required this.occasionalClosures,
    required this.servicesList,
   
  });

  Map<String, dynamic> toMap() {
    return {
      "shopImage": shopImage,
      "services": services,
      "occasionalClosures": occasionalClosures,
      "servicesList":servicesList
    };
  }
}
