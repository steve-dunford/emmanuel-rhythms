import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emmanuel_rhythms_app/common/firebase_collections.dart';
import 'package:emmanuel_rhythms_app/models/items/daily_content_instance.dart';

abstract class DailyContentRepository {
  Stream<List<DailyContentInstance>> itemInstancesForDates(DateTime startDate, DateTime endDate);
  Stream<List<DailyContentInstance>> allInstances();
}

class FirebaseDailyContentRepository extends DailyContentRepository {

  @override
  Stream<List<DailyContentInstance>> itemInstancesForDates(DateTime startDate, DateTime endDate) {
    return FirebaseFirestore.instance
        .collection(FirebaseCollections.dailyContentInstances)
        .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(startDate.toUtc()))
        .where('date', isLessThanOrEqualTo: Timestamp.fromDate(endDate.toUtc()))
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) {
          return DailyContentInstance.fromJson(doc.data());
        }).toList());
  }

  //TEMPORARY - not scalable
  @override
  Stream<List<DailyContentInstance>> allInstances() {
    return FirebaseFirestore.instance
        .collection(FirebaseCollections.dailyContentInstances)
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) {
          return DailyContentInstance.fromJson(doc.data());
        }).toList());
  }
}
