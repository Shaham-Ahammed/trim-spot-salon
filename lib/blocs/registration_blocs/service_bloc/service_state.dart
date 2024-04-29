

part of 'service_bloc.dart';

@immutable
sealed class ServiceBlocState {
 final Map<String, bool> switches;

 const ServiceBlocState({required this.switches});
}

final class ServiceBlocInitial extends ServiceBlocState {
 ServiceBlocInitial({required Map<String, bool> switches}) : super(switches: switches);
}
