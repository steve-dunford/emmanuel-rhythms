extension DateTimeExtensions on DateTime {
  DateTime get atMidnight =>
      DateTime.utc(year, month, day, 0,0,0);
}