import 'package:trim_spot_barber_side/blocs/shop_management_blocs/service_bloc/service_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/shop_image/profile_shop_image_bloc.dart';
import 'package:trim_spot_barber_side/blocs/shop_management_blocs/occasional_closure_bloc/occasional_closure_bloc.dart';
import 'package:trim_spot_barber_side/blocs/shop_management_blocs/save_button_bloc/save_button_shop_managemen_bloct.dart';

class ShapManagementProvider {
  List<BlocProvider> getBlocProviders() {
    return [
      BlocProvider<ShopManagementServiceBloc>(
          create: (context) => ShopManagementServiceBloc()),
      BlocProvider<ShopManagementSaveButtonBloc>(
          create: (context) => ShopManagementSaveButtonBloc()),
      BlocProvider<OccasionalClosureBloc>(
          create: (context) => OccasionalClosureBloc()),
      BlocProvider<ProfileShopImageBloc>(
          create: (context) => ProfileShopImageBloc()),
    ];
  }
}
