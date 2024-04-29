import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/working_hours/working_hours_bloc.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';


class ClosingTimeSelector extends StatelessWidget {
  const ClosingTimeSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      color: Colors.blueGrey.shade900,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          Navigator.of(context).push(
            showPicker(
              blurredBackground: true,
              context: context,
              value: Time(hour: 20, minute: 0),
              onChange: (p0) {},
              sunrise: TimeOfDay(hour: 6, minute: 0),
              sunset: TimeOfDay(hour: 18, minute: 0),
              duskSpanInMinutes: 120,
              onChangeDateTime: (time) {
                context
                    .read<WorkingHoursBloc>()
                    .add(ClosingTimeSelected(closingTime: time));
              },
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: cyanColor, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          height: mediaqueryHeight(0.07, context),
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mediaqueryWidth(0.045, context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<WorkingHoursBloc, WorkingHoursState>(
                  builder: (context, state) {
                    if (state is WorkingHoursInitial &&
                        state.closingTime != null) {
                      return myFont(state.closingTimeDisplayText,
                          fontFamily: balooChettan,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontColor: whiteColor);
                    }
                    return myFont("Closing Time",
                        fontFamily: balooChettan,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        fontColor: greyColor2);
                  },
                ),
                Icon(
                  Icons.schedule,
                  color: Colors.red.shade600,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

