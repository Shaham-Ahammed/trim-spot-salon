DateTime today = DateTime.now();

DateTime oneWeekFromToday = today.add(Duration(days: 7));

List<DateTime> days = [];
getOneWeekFromToday() {
  days.clear();
  for (DateTime day = today.add(Duration(days: 1));
      day.isBefore(oneWeekFromToday);
      day = day.add(Duration(days: 1))) {
    days.add(day);
  }
}
