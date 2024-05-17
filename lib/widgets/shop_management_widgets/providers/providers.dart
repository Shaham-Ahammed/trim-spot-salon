import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/shop_management_blocs/occasional_closure_bloc/occasional_closure_bloc.dart';
import 'package:trim_spot_barber_side/blocs/shop_management_blocs/save_button_bloc/save_button_shop_managemen_bloct.dart';

class ShapManagementProvider {
  List<BlocProvider> getBlocProviders() {
    return [
 
      BlocProvider<OccasionalClosureBloc>(
          create: (context) => OccasionalClosureBloc()),
    
    ];
  }
}
