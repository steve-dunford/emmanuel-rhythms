import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emmanuel_rhythms_cms/common/firebase_collections.dart';
import 'package:emmanuel_rhythms_cms/models/items/daily_content.dart';
import 'package:emmanuel_rhythms_cms/models/items/item.dart';
import 'package:emmanuel_rhythms_cms/models/items/daily_content_instance.dart';

abstract class DailyContentRepository {
  Stream<List<DailyContent>> dailyContent();
  Stream<List<DailyContentInstance>> dailyContentInstances(DateTime startDate, DateTime endDate);
  Future<void> upsertDailyContent(DailyContent content);
  Future<void> deleteDailyContent(DailyContent content);
}

class FirebaseDailyContentRepository extends DailyContentRepository {
  @override
  Stream<List<DailyContent>> dailyContent() {
    return FirebaseFirestore.instance
        .collection(FirebaseCollections.dailyContent)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => DailyContent.fromJson(doc.data())).toList());
  }

  @override
  Stream<List<DailyContentInstance>> dailyContentInstances(DateTime startDate, DateTime endDate) {
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

  Future<void> deleteDailyContent(DailyContent content) async {
    return FirebaseFirestore.instance.runTransaction((transaction) async {

      //Get a reference to the items
      final contentRef = FirebaseFirestore.instance
          .collection(FirebaseCollections.dailyContent)
          .doc(content.dailyContentId);

      final instanceRefs = await FirebaseFirestore.instance
          .collection(FirebaseCollections.dailyContentInstances)
          .where('dailyContentId', isEqualTo: content.dailyContentId)
          .get();

      //Delete instances
      for (var doc in instanceRefs.docs) {
        transaction.delete(doc.reference);
      }

      //Delete the item document
      transaction.delete(contentRef);
    });
  }

  @override
  Future<void> upsertDailyContent(DailyContent content) async {

    return FirebaseFirestore.instance.runTransaction((transaction) async {

      //Get a reference to the content
      final contentRef = FirebaseFirestore.instance
          .collection(FirebaseCollections.dailyContent)
          .doc(content.dailyContentId);

      final instanceRefs = await FirebaseFirestore.instance
          .collection(FirebaseCollections.dailyContentInstances)
          .where('dailyContentId', isEqualTo: content.dailyContentId)
          .get();

      //Delete existing instances
      for (var doc in instanceRefs.docs) {
        transaction.delete(doc.reference);
      }

      //Set the new item document
      transaction.set(contentRef, content.toJson());

      final newInstances = content.generateInstances();

      //Add new instances
      for(var newInstance in newInstances) {
        final ref = FirebaseFirestore.instance
            .collection(FirebaseCollections.dailyContentInstances)
            .doc(newInstance.dailyContentInstanceId);

        transaction.set(ref, newInstance.toJson());
      }
    });

  }
}
