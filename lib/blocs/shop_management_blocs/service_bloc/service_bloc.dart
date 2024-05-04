import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/data/data_provider/user_data_document.dart';
import 'package:trim_spot_barber_side/data/repository/document_model.dart';
import 'package:trim_spot_barber_side/utils/shop_management/service_controllers.dart';

part 'service_state.dart';
part 'service_event.dart';

class ShopManagementServiceBloc extends Bloc<ShopManagementServiceBlocEvent,
    ShopManagementServiceBlocState> {
  ShopManagementServiceBloc()
      : super(ServiceBlocInitial(switches: {
          "haircut": false,
          "facial": false,
          "shave": false,
          "beard trim": false,
          "massage": false,
          "straighten": false
        })) {
    on<ServiceSwitchPressed>(_serviceSwitchPressed);
    on<FetchingOriginalServices>(_fetchingOriginalServices);
  }
  void _serviceSwitchPressed(ServiceSwitchPressed event,
      Emitter<ShopManagementServiceBlocState> emit) {
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

  _fetchingOriginalServices(FetchingOriginalServices event,
      Emitter<ShopManagementServiceBlocState> emit) async {
    final data = await UserDataDocumentFromFirebase().userDocument();
    final rawData = data[SalonDocumentModel.services] as Map<String, dynamic>;
    final Map<String, Map<String, String>> currentServices = {};

    rawData.forEach((key, value) {
      if (value is Map<String, dynamic>) {
        currentServices[key] =
            Map<String, String>.from(value.cast<String, String>());
      }
    });

   
    List<String> services = [];
    currentServices.forEach((key, value) {
      services.add(key);
      if (key == "haircut") {
        sMhaircutRateController.text = value['rate']!;
        sMhaircutTimeController.text = value['time']!;
      } else if (key == "facial") {
        sMfacialRateController.text = value['rate']!;
        sMfacialTimeController.text = value['time']!;
      } else if (key == "shave") {
        sMshaveRateController.text = value['rate']!;
        sMshaveTimeController.text = value['time']!;
      } else if (key == "beard trim") {
        sMbeardTrimRateController.text = value['rate']!;
        sMbeardTrimTimeController.text = value['time']!;
      } else if (key == "massage") {
        sMmassageRateController.text = value['rate']!;
        sMmassageTimeController.text = value['time']!;
      } else if (key == "straighten") {
        sMstraightenRateController.text = value['rate']!;
        sMstraightenTimeController.text = value['time']!;
      }
    });
    Map<String, bool> map = {
          "haircut": false,
          "facial": false,
          "shave": false,
          "beard trim": false,
          "massage": false,
          "straighten": false
        };
    services.forEach((element) {
      if (map.containsKey(element)) {
        map[element] = true;
      }
    });
    emit(ServiceBlocInitial(switches: map));
  }
}
