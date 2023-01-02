extension DateTimeExtensions on DateTime {

  DateTime get atMidnight =>
      DateTime(year, month, day, 0,0,0).toUtc(); 
  
  DateTime get startOfMonth =>
      DateTime(year, month, 1, 0,0,0).toUtc();

  DateTime get endOfMonth {
    final newYear = month == 12 ? year + 1 : year;
    final newMonth = (month + 1) % 12;
    return DateTime(newYear, newMonth, 1, 0,0,0).subtract(const Duration(days: 1)).toUtc();
  }

}