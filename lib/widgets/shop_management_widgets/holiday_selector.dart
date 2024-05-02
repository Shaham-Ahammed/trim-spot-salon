import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:trim_spot_barber_side/blocs/shop_management_blocs/holiday_bloc/holiday_bloc_bloc.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/registration_page/holidays.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

class HolidaySelector extends StatefulWidget {
  const HolidaySelector({
    super.key,
  });

  @override
  State<HolidaySelector> createState() => _HolidaySelectorState();
}

class _HolidaySelectorState extends State<HolidaySelector> {
  @override
  void initState() {
    context.read<ShopManagementHolidayBloc>().add(FetchOriginalHolidays());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopManagementHolidayBloc,
        ShopManagementHolidayBlocState>(
      builder: (context, state) {
        return SizedBox(
          height: mediaqueryHeight(0.25, context),
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: weekDays.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: mediaqueryWidth(0.04, context),
              mainAxisSpacing: mediaqueryHeight(0.03, context),
              childAspectRatio: 2.2,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => context
                    .read<ShopManagementHolidayBloc>()
                    .add(HolidaysSelected(day: weekDays[index])),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: state.holidays.contains(weekDays[index])
                          ? cyanColor
                          : greyColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    color: state.holidays.contains(weekDays[index])
                        ? cyanColor
                        : greyColor3,
                  ),
                  child: Center(
                    child: myFont(
                      weekDays[index],
                      fontFamily: balooChettan,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontColor: state.holidays.contains(weekDays[index])
                          ? blackColor
                          : greyColor,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
