import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:trim_spot_barber_side/blocs/shop_management_blocs/occasional_closure_bloc/occasional_closure_bloc.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/widgets/shop_management_widgets/occasional_closure_colors.dart';
import 'package:trim_spot_barber_side/widgets/shop_management_widgets/one_week.dart';

class OccasionalClosuresSelector extends StatefulWidget {
  const OccasionalClosuresSelector({
    super.key,
  });

  @override
  State<OccasionalClosuresSelector> createState() =>
      _OccasionalClosuresSelectorState();
}

class _OccasionalClosuresSelectorState
    extends State<OccasionalClosuresSelector> {
  @override
  void initState() {
    context
        .read<OccasionalClosureBloc>()
        .add(FetchingOriginalOccasionalHolidays());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getOneWeekFromToday();
    return BlocBuilder<OccasionalClosureBloc, OccasionalClosureState>(
      builder: (context, state) {
        return Container(
          height: mediaqueryHeight(0.13, context),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: days.length,
            itemBuilder: (context, index) {
              String formattedMonth = DateFormat('MMMM').format(days[index]);
              String formattedDay = DateFormat('EEE').format(days[index]);
              String formattedDate = DateFormat('dd').format(days[index]);
              return Padding(
                padding:
                    EdgeInsets.only(right: mediaqueryHeight(0.012, context)),
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  color:
                      containerColorOfOccasionalClosure(days[index], context),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      context
                          .read<OccasionalClosureBloc>()
                          .add(SelectedADay(day: days[index]));
                    },
                    child: Container(
                        height: mediaqueryHeight(0.13, context),
                        width: mediaqueryWidth(0.17, context),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              color: containerBorderColorOfOccasionalClosure(
                                  days[index], context)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            myFont(formattedMonth,
                                fontFamily: balooChettan,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                fontColor: fontColorOfOccasionalClosure(
                                    days[index], context)),
                            myFont(formattedDate,
                                fontFamily: balooChettan,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                fontColor: fontColorOfOccasionalClosure(
                                    days[index], context)),
                            myFont(formattedDay,
                                fontFamily: cabinCondensed,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                fontColor: fontColorOfOccasionalClosure(
                                    days[index], context)),
                          ],
                        )),
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
