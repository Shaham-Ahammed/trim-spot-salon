import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/slot_selection_bloc/slot_selection_bloc.dart';

import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/homepage/slo_booking_colors.dart';
import 'package:trim_spot_barber_side/utils/homepage/slot_tiles_timings.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

class SlotTiles extends StatelessWidget {
  const SlotTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SlotSelectionBloc, SlotSelectionState>(
      builder: (context, state) {
        final event = context.read<SlotSelectionBloc>();
        return Column(
          children: [
            ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: (timeSlots.length / 4).ceil(),
                  itemBuilder: (BuildContext context, int index) {
                    int startIndex = index * 4;
                    int endIndex = startIndex + 4 > timeSlots.length
              ? timeSlots.length
              : startIndex + 4;
                    List<String> timeSlotsRow = timeSlots.sublist(startIndex, endIndex);
                    return Padding(
            padding:  EdgeInsets.only(top: mediaqueryHeight(0.02, context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: timeSlotsRow.map((time) {
                return Padding(
                  padding:
                      EdgeInsets.only(left: mediaqueryHeight(0.014, context)),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8.0),
                    onTap: () {
                      event.add(SelectedSlot(
                          time: time, ));
                    },
                    child: Container(
                        height: mediaqueryHeight(0.045, context),
                        width: mediaqueryWidth(0.19, context),
                        decoration: BoxDecoration(
                          color: contianerColor(time, context),
                          border: Border.all(color: borderColor(time, context)),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: myFont(time,
                              fontFamily: cabinCondensed,
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              fontColor: textColor(time, context)),
                        )),
                  ),
                );
              }).toList(),
            ),
                    );
                  },
                ),
          ],
        );
      },
    );
  }
}
