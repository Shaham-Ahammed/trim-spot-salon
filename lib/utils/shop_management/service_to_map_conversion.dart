import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/shop_management_blocs/service_bloc/service_bloc.dart';
import 'package:trim_spot_barber_side/utils/shop_management/service_controllers.dart';

Map<String, Map<String, String>> serviceToMapConversionInShopManagement(context) {
  Map<String, Map<String, String>> ListOfServices = {};
  final bloc =
      BlocProvider.of<ShopManagementServiceBloc>(context, listen: false);
  final switches = bloc.state.switches;
  List<String> services =
      switches.keys.where((element) => switches[element] == true).toList();
  if (services.contains("haircut")) {
    ListOfServices.addAll({
      "haircut": {
        "time": sMhaircutTimeController.text.toString(),
        "rate": sMhaircutRateController.text.toString()
      }
    });
  }
  if (services.contains("facial")) {
    ListOfServices.addAll({
      "facial": {
        "time": sMfacialTimeController.text.toString(),
        "rate": sMfacialRateController.text.toString()
      }
    });
  }
  if (services.contains("straighten")) {
    ListOfServices.addAll({
      "straighten": {
        "time": sMstraightenTimeController.text.toString(),
        "rate": sMstraightenRateController.text.toString()
      }
    });
  }
  if (services.contains("massage")) {
    ListOfServices.addAll({
      "massage": {
        "time": sMmassageTimeController.text.toString(),
        "rate": sMmassageRateController.text.toString()
      }
    });
  }
  if (services.contains("beard trim")) {
    ListOfServices.addAll({
      "beard trim": {
        "time": sMbeardTrimTimeController.text.toString(),
        "rate": sMbeardTrimRateController.text.toString()
      }
    });
  }
  if (services.contains("shave")) {
    ListOfServices.addAll({
      "shave": {
        "time": sMshaveTimeController.text.toString(),
        "rate": sMshaveRateController.text.toString()
      }
    });
  }

  return ListOfServices;
}
