extension DateTimeExtensions on DateTime {

  DateTime get atMidnight =>
      DateTime(year, month, day, 0,0,0).toUtc();

}