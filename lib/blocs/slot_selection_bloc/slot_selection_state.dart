part of 'slot_selection_bloc.dart';

@immutable
sealed class SlotSelectionState {
  final List<String> selectedSlots;

  SlotSelectionState({required this.selectedSlots});
}

final class SlotSelectionInitial extends SlotSelectionState {
  SlotSelectionInitial({required super.selectedSlots});
}
