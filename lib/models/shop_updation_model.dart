class ShopUpdationModel {
  Map<String, Map<String, String>> services;
  List<String> occasionalClosures;
  List<String> servicesList;
  ShopUpdationModel({
    required this.services,
    required this.occasionalClosures,
    required this.servicesList,
  });

  Map<String, dynamic> toMap() {
    return {
      "services": services,
      "occasionalClosures": occasionalClosures,
      "servicesList": servicesList
    };
  }
}
