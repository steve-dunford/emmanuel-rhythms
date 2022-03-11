import 'package:emmanuel_rhythms_cms/models/items/item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ItemRepository {

  Stream<List<Item>> itemChangesForDates(DateTime startDate, DateTime endDate);
}

class FirebaseItemRepository extends ItemRepository {
  @override
  Stream<List<Item>> itemChangesForDates(DateTime startDate, DateTime endDate) {
      return FirebaseFirestore.instance
          .collection('items')
          .where('startDate', isLessThanOrEqualTo: startDate)
          .where('endDate', isGreaterThanOrEqualTo: endDate)
          .snapshots()
          .map((snapshot) => snapshot.docs.map((doc) => Item.fromDocument(doc)).toList());
  }

}