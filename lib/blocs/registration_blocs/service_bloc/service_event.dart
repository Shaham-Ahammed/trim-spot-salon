part of 'service_bloc.dart';

@immutable
sealed class ServiceBlocEvent {}

class ServiceSwitchPressed extends ServiceBlocEvent {
  final String service;
  final TextEditingController ratecontroller;
  final TextEditingController timeController;
  ServiceSwitchPressed(
      {required this.service,
      required this.ratecontroller,
      required this.timeController});
}
