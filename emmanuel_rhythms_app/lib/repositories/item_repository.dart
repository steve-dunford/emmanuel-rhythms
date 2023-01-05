import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emmanuel_rhythms_app/common/firebase_collections.dart';
import 'package:emmanuel_rhythms_app/models/items/item.dart';
import 'package:emmanuel_rhythms_app/models/items/item_instance.dart';

abstract class ItemRepository {
  Stream<List<ItemInstance>> itemInstancesForDates(DateTime startDate, DateTime endDate);
  Stream<List<ItemInstance>> allItemInstances();
}

class FirebaseItemRepository extends ItemRepository {

  @override
  Stream<List<ItemInstance>> itemInstancesForDates(DateTime startDate, DateTime endDate) {
    return FirebaseFirestore.instance
        .collection(FirebaseCollections.itemInstances)
        .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(startDate.toUtc()))
        .where('date', isLessThanOrEqualTo: Timestamp.fromDate(endDate.toUtc()))
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) {
          return ItemInstance.fromJson(doc.data());
        }).toList());
  }

  //TEMPORARY - not scalable
  @override
  Stream<List<ItemInstance>> allItemInstances() {
    return FirebaseFirestore.instance
        .collection(FirebaseCollections.itemInstances)
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) {
          return ItemInstance.fromJson(doc.data());
        }).toList());
  }
}
