
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/slot_selection_bloc/slot_selection_bloc.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/submit_buttons.dart';

class LockSlotsButton extends StatelessWidget {
  const LockSlotsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SlotSelectionBloc, SlotSelectionState>(
      builder: (context, state) {
        return submitButtonCyan(context, text: "Lock Slots",
            function: () {
          return null;
        },
            heigh: mediaqueryHeight(0.05, context),
            width: mediaqueryWidth(0.3, context),
            fontSize: mediaqueryHeight(0.02, context),
            buttonColor: buttonColor(context));
      },
    );
  }
}

Color buttonColor(context) {
  final selectedItems =
      BlocProvider.of<SlotSelectionBloc>(context).state.selectedSlots;
  if (selectedItems.isEmpty) {
    return greyColor;
  } else {
    return cyanColor;
  }
}
