part of 'slot_selection_bloc.dart';

@immutable
sealed class SlotSelectionEvent {}

final class SelectedSlot extends SlotSelectionEvent {
  final String time;

  SelectedSlot({required this.time});
  
}
