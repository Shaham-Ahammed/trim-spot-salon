import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/service_bloc/service_bloc.dart';
import 'package:trim_spot_barber_side/utils/registration_page/textediting_controllers.dart';

Map<String, Map<String, String>> serviceToMapConversion(context) {
 Map<String, Map<String, String>> ListOfServices = {};
  final bloc = BlocProvider.of<ServiceBloc>(context, listen: false);
  final switches = bloc.state.switches;
  List<String> services =
      switches.keys.where((element) => switches[element] == true).toList();
  if (services.contains("haircut")) {
    ListOfServices.addAll({
      "haircut": {
        "time": haircutTimeController.text.toString(),
        "rate": haircutRateController.text.toString()
      }
    });
  }
  if (services.contains("facial")) {
    ListOfServices.addAll({
      "facial": {
        "time": facialTimeController.text.toString(),
        "rate": facialRateController.text.toString()
      }
    });
  }
  if (services.contains("straighten")) {
    ListOfServices.addAll({
      "straighten": {
        "time": straightenTimeController.text.toString(),
        "rate": straightenRateController.text.toString()
      }
    });
  }
  if (services.contains("massage")) {
    ListOfServices.addAll({
      "massage": {
        "time": massageTimeController.text.toString(),
        "rate": massageRateController.text.toString()
      }
    });
  }
  if (services.contains("beard trim")) {
    ListOfServices.addAll({
      "beard trim": {
        "time": beardTrimTimeController.text.toString(),
        "rate": beardTrimRateController.text.toString()
      }
    });
  }
  if (services.contains("shave")) {
    ListOfServices.addAll({
      "shave": {
        "time": shaveTimeController.text.toString(),
        "rate": shaveRateController.text.toString()
      }
    });
  }

  return ListOfServices;
}
