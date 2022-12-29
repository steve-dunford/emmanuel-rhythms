import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class TimestampConverter extends JsonConverter<DateTime, Timestamp> {

  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp json) {
    return json.toDate();
  }

  @override
  Timestamp toJson(DateTime object) {
    return Timestamp.fromDate(object);
  }
}

class NullableTimestampConverter extends JsonConverter<DateTime?, Timestamp?> {

  const NullableTimestampConverter();

  @override
  DateTime? fromJson(Timestamp? json) {
    if(json == null) {
      return null;
    }
    return json.toDate();
  }

  @override
  Timestamp? toJson(DateTime? object) {
    if(object == null) {
      return null;
    }

    return Timestamp.fromDate(object);
  }
}

class TimestampListConverter extends JsonConverter<List<DateTime>, List<dynamic>> {

  const TimestampListConverter();

  @override
  List<DateTime> fromJson(List<dynamic> json) {
    return json.map((e) => (e as Timestamp).toDate()).toList();
  }

  @override
  List<dynamic> toJson(List<DateTime> object) {
    return object.map((e) => Timestamp.fromDate(e)).toList();
  }
}