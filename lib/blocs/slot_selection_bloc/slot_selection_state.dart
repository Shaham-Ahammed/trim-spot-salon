part of 'slot_selection_bloc.dart';

@immutable
sealed class SlotSelectionState {
  final List<String> totalSlots;
  final List<String> selectedSlots;

  SlotSelectionState({required this.selectedSlots, required this.totalSlots});
}

final class SlotSelectionInitial extends SlotSelectionState {
  SlotSelectionInitial(
      {required super.selectedSlots, required super.totalSlots});
}
