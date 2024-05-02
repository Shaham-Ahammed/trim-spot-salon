import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/service_bloc/service_bloc.dart';
import 'package:trim_spot_barber_side/utils/registration_page/textediting_controllers.dart';

List<Map<String, Map<String, String>>> serviceToMapConversion(context) {
 List< Map<String, Map<String, String>>> ListOfServices = [];
  final bloc = BlocProvider.of<ServiceBloc>(context, listen: false);
  final switches = bloc.state.switches;
  List<String> services =
      switches.keys.where((element) => switches[element] == true).toList();
  if (services.contains("haircut")) {
    ListOfServices.add({
      "haircut": {
        "time": haircutTimeController.text.toString(),
        "rate": haircutRateController.text.toString()
      }
    });
  }
  if (services.contains("facial")) {
    ListOfServices.add({
      "facial": {
        "time": facialTimeController.text.toString(),
        "rate": facialRateController.text.toString()
      }
    });
  }
  if (services.contains("straighten")) {
    ListOfServices.add({
      "straighten": {
        "time": straightenTimeController.text.toString(),
        "rate": straightenRateController.text.toString()
      }
    });
  }
  if (services.contains("massage")) {
    ListOfServices.add({
      "massage": {
        "time": massageTimeController.text.toString(),
        "rate": massageRateController.text.toString()
      }
    });
  }
  if (services.contains("beard trim")) {
    ListOfServices.add({
      "beard trim": {
        "time": beardTrimTimeController.text.toString(),
        "rate": beardTrimRateController.text.toString()
      }
    });
  }
  if (services.contains("shave")) {
    ListOfServices.add({
      "shave": {
        "time": shaveTimeController.text.toString(),
        "rate": shaveRateController.text.toString()
      }
    });
  }

  return ListOfServices;
}
