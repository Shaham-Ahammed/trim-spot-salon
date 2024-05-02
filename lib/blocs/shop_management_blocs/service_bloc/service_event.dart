part of 'service_bloc.dart';

@immutable
sealed class ShopManagementServiceBlocEvent {}

class ServiceSwitchPressed extends ShopManagementServiceBlocEvent {
  final String service;
  final TextEditingController ratecontroller;
  final TextEditingController timeController;
  ServiceSwitchPressed(
      {required this.service,
      required this.ratecontroller,
      required this.timeController});
}
class FetchingOriginalServices extends ShopManagementServiceBlocEvent{}
