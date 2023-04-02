extension DateTimeExtensions on DateTime {
  DateTime get atMidnight => DateTime.utc(year, month, day, 0, 0, 0).toUtc();

  DateTime get startOfMonth => DateTime.utc(year, month, 1, 0, 0, 0).toUtc();

  DateTime get endOfMonth {
    final newYear = month == 12 ? year + 1 : year;
    final newMonth = (month + 1) % 12;
    return DateTime.utc(newYear, newMonth, 1, 0, 0, 0)
        .subtract(const Duration(days: 1))
        .toUtc();
  }

  //Converts a local date to UTC AS IF the date were already UTC (i.e. does not just convert the ticks to UTC -
  //keeps the date and time the same but as if the date were originally UTC)
  DateTime treatAsUtc() {
    return DateTime.utc(
        year, month, day, hour, minute, second, millisecond, microsecond);
  }
}
