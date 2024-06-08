import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/forget_password_blocs/eye_button_bloc/eye_button_on_new_password_bloc.dart';
import 'package:trim_spot_barber_side/blocs/forget_password_blocs/forget_password_bloc/forget_password_bloc.dart';
import 'package:trim_spot_barber_side/blocs/home_screen_pageview_bloc/home_screen_page_controller_bloc.dart';
import 'package:trim_spot_barber_side/blocs/bottom_navigation_bloc/bottom_navigation_bar_bloc.dart';
import 'package:trim_spot_barber_side/blocs/on_boarding_bloc/onboardind_bloc_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/email_bloc/profile_email_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/name_bloc/profile_name_bloc.dart';
import 'package:trim_spot_barber_side/blocs/shop_management_blocs/shop_image/profile_shop_image_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/user_profile_image_bloc/profile_user_image_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/profile_password_bloc/profile_password_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/holiday_bloc/holiday_bloc_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/image_bloc/image_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/location_bloc/location_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/register_button_bloc/register_button_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/service_bloc/service_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/working_hours/working_hours_bloc.dart';
import 'package:trim_spot_barber_side/blocs/shop_management_blocs/save_button_bloc/save_button_shop_managemen_bloct.dart';

import 'package:trim_spot_barber_side/blocs/shop_management_blocs/service_bloc/service_bloc.dart';

import 'package:trim_spot_barber_side/blocs/slot_selection_bloc/slot_selection_bloc.dart';
import 'package:trim_spot_barber_side/blocs/user_details_bloc/user_details_bloc.dart';

List<BlocProvider> mainProviders = [
   BlocProvider<EyeButtonOnNewPasswordBloc>(create: (context) => EyeButtonOnNewPasswordBloc()),
  BlocProvider<ForgetPasswordBloc>(create: (context) => ForgetPasswordBloc()),
  BlocProvider<ShopManagementServiceBloc>(
      create: (context) => ShopManagementServiceBloc()),
  BlocProvider<ProfileShopImageBloc>(
      create: (context) => ProfileShopImageBloc()),
  BlocProvider<SlotSelectionBloc>(create: (context) => SlotSelectionBloc()),
  BlocProvider<ShopManagementSaveButtonBloc>(
      create: (context) => ShopManagementSaveButtonBloc()),
  BlocProvider<ProfilePasswordBloc>(create: (context) => ProfilePasswordBloc()),
  BlocProvider<UserDetailsBloc>(create: (context) => UserDetailsBloc()),
  BlocProvider<HolidayBloc>(create: (context) => HolidayBloc()),
  BlocProvider<ServiceBloc>(create: (context) => ServiceBloc()),
  BlocProvider<WorkingHoursBloc>(create: (context) => WorkingHoursBloc()),
  BlocProvider<ImageBloc>(create: (context) => ImageBloc()),
  BlocProvider<RegisterButtonBloc>(create: (context) => RegisterButtonBloc()),
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
