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
          SalonDocumentModel.serviceHaircut: false,
          SalonDocumentModel.serviceFacial: false,
          SalonDocumentModel.serviceShave: false,
          SalonDocumentModel.serviceBeardTrim: false,
          SalonDocumentModel.serviceMassage: false,
          SalonDocumentModel.serviceStraighten: false
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
      if (key == SalonDocumentModel.serviceHaircut) {
        sMhaircutRateController.text = value[SalonDocumentModel.serviceRate]!;
        sMhaircutTimeController.text = value[SalonDocumentModel.serviceTime]!;
      } else if (key == SalonDocumentModel.serviceFacial) {
        sMfacialRateController.text = value[SalonDocumentModel.serviceRate]!;
        sMfacialTimeController.text = value[SalonDocumentModel.serviceTime]!;
      } else if (key == SalonDocumentModel.serviceShave) {
        sMshaveRateController.text = value[SalonDocumentModel.serviceRate]!;
        sMshaveTimeController.text = value[SalonDocumentModel.serviceTime]!;
      } else if (key == SalonDocumentModel.serviceBeardTrim) {
        sMbeardTrimRateController.text = value[SalonDocumentModel.serviceRate]!;
        sMbeardTrimTimeController.text = value[SalonDocumentModel.serviceTime]!;
      } else if (key == SalonDocumentModel.serviceMassage) {
        sMmassageRateController.text = value[SalonDocumentModel.serviceRate]!;
        sMmassageTimeController.text = value[SalonDocumentModel.serviceTime]!;
      } else if (key == SalonDocumentModel.serviceStraighten) {
        sMstraightenRateController.text =
            value[SalonDocumentModel.serviceRate]!;
        sMstraightenTimeController.text =
            value[SalonDocumentModel.serviceTime]!;
      }
    });
    Map<String, bool> map = {
      SalonDocumentModel.serviceHaircut: false,
      SalonDocumentModel.serviceFacial: false,
      SalonDocumentModel.serviceShave: false,
      SalonDocumentModel.serviceBeardTrim: false,
      SalonDocumentModel.serviceMassage: false,
      SalonDocumentModel.serviceStraighten: false
    };
    services.forEach((element) {
      if (map.containsKey(element)) {
        map[element] = true;
      }
    });
    emit(ServiceBlocInitial(switches: map));
  }
}
