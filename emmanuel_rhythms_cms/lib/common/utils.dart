List<DateTime> datesBetween(DateTime start, DateTime end) {
  List<DateTime> allDates = [];

  var current = DateTime(start.year, start.month, start.day, 0, 0);

  while(current.isBefore(end)) {
    allDates.add(current);
    current = current.add(const Duration(days: 1));
  }

  return allDates;

}