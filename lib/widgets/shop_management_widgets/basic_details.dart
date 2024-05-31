import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/widgets/shop_management_widgets/basic_details_container.dart';
import 'package:trim_spot_barber_side/widgets/shop_management_widgets/opening_and_closing.dart';



class ShopDetailsInShopManagement extends StatelessWidget {
  const ShopDetailsInShopManagement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: mediaqueryHeight(0.3, context),
      color: appBarColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BasicShopDetails(
              icon: Icons.store,
              text: context.watch<UserDetailsBloc>().state.shopName),
          BasicShopDetails(
            icon: Icons.location_on,
            text: context.watch<UserDetailsBloc>().state.shopLocation,
          ),
          OpeningAndClosingTimeInShopManagement(),
          BlocBuilder<UserDetailsBloc, UserDetailsState>(
            builder: (context, state) {
              if (state.holidays.isNotEmpty) {
                return BasicShopDetails(
                  icon: Icons.event_busy,
                  text: context.watch<UserDetailsBloc>().state.holidays,
                );
              }
              return Container();
            },
          )
        ],
      ),
    );
  }
}

