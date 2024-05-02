part of 'service_bloc.dart';

@immutable
sealed class ShopManagementServiceBlocState {
  final Map<String, bool> switches;

  const ShopManagementServiceBlocState({required this.switches});
}

final class ServiceBlocInitial extends ShopManagementServiceBlocState {
  ServiceBlocInitial({required Map<String, bool> switches})
      : super(switches: switches);
}
