import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'service_state.dart';
part 'service_event.dart';

class ServiceBloc extends Bloc<ServiceBlocEvent, ServiceBlocState> {
  ServiceBloc()
      : super(ServiceBlocInitial(switches: {
          "haircut": false,
          "facial": false,
          "shave": false,
          "beard trim": false,
          "massage": false,
          "straighten": false
        })) {
    on<ServiceSwitchPressed>(_serviceSwitchPressed);
  }
  void _serviceSwitchPressed(
      ServiceSwitchPressed event, Emitter<ServiceBlocState> emit) {
    final updatedSwitches =
        Map<String, bool>.from((state as ServiceBlocInitial).switches);
    updatedSwitches[event.service] = !updatedSwitches[event.service]!;
    if (updatedSwitches[event.service] == false) {
      event.ratecontroller.clear();
      event.timeController.clear();
    }
    emit(ServiceBlocInitial(
      switches: updatedSwitches,
    ));
  }
}
