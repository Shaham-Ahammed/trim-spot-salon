import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/home_screen_pageview_bloc/home_screen_page_controller_bloc.dart';
import 'package:trim_spot_barber_side/blocs/bottom_navigation_bloc/bottom_navigation_bar_bloc.dart';
import 'package:trim_spot_barber_side/blocs/on_boarding_bloc/onboardind_bloc_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/email_bloc/profile_email_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/name_bloc/profile_name_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/user_profile_image_bloc/profile_user_image_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/profile_password_bloc/profile_password_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/holiday_bloc/holiday_bloc_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/image_bloc/image_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/location_bloc/location_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/register_button_bloc/register_button_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/service_bloc/service_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/working_hours/working_hours_bloc.dart';
import 'package:trim_spot_barber_side/blocs/shop_management_blocs/holiday_bloc/holiday_bloc_bloc.dart';
import 'package:trim_spot_barber_side/blocs/shop_management_blocs/working_hours/working_hours_bloc.dart';
import 'package:trim_spot_barber_side/blocs/user_details_bloc/user_details_bloc.dart';


class MainBlocProviders {
  List<BlocProvider> providersList() {
    return [
      BlocProvider(create: (context) => ShopManagementHolidayBloc()),
      BlocProvider(create: (context) => ShopManagementWorkingHoursBloc()),
      BlocProvider(create: (context) => ProfilePasswordBloc()),
      BlocProvider(create: (context) => UserDetailsBloc()),
      BlocProvider(create: (context) => HolidayBloc()),
      BlocProvider<ServiceBloc>(create: (context) => ServiceBloc()),
      BlocProvider<WorkingHoursBloc>(create: (context) => WorkingHoursBloc()),
      BlocProvider<ImageBloc>(create: (context) => ImageBloc()),
      BlocProvider(create: (context) => RegisterButtonBloc()),
      BlocProvider<ProfileEmailBloc>(create: (context) => ProfileEmailBloc()),
      BlocProvider<ProfileUserImageBloc>(
          create: (context) => ProfileUserImageBloc()),
      BlocProvider<ProfileNameBloc>(create: (context) => ProfileNameBloc()),
      BlocProvider<HomeScreenPageControllerBloc>(
          create: (context) => HomeScreenPageControllerBloc()),
      BlocProvider<BottomNavigationBarBloc>(
          create: (context) => BottomNavigationBarBloc()),
      BlocProvider<LocationBloc>(create: (context) => LocationBloc()),
      BlocProvider<OnboardindBloc>(create: (context) => OnboardindBloc()),
    ];
  }
}
