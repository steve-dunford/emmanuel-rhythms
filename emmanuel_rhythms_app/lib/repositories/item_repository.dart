// import 'package:cloud_firestore/cloud_firestore.dart';
//
// abstract class ItemRepository {
//   Stream<List<Item>> itemsForDates(DateTime startDate, DateTime endDate);
//   Stream<List<ItemInstance>> itemInstancesForDates(DateTime startDate, DateTime endDate);
//   Future<void> upsertItem(Item item);
//   Future<void> deleteItem(Item item);
// }
//
// class FirebaseItemRepository extends ItemRepository {
//   @override
//   Stream<List<Item>> itemsForDates(DateTime startDate, DateTime endDate) {
//     return FirebaseFirestore.instance
//         .collection(FirebaseCollections.items)
//         .snapshots()
//         .map((snapshot) =>
//         snapshot.docs.map((doc) => Item.fromJson(doc.data())).toList());
//   }
//
//
//
//   @override
//   Stream<List<ItemInstance>> itemInstancesForDates(DateTime startDate, DateTime endDate) {
//     return FirebaseFirestore.instance
//         .collection(FirebaseCollections.itemInstances)
//         .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(startDate.toUtc()))
//         .where('date', isLessThanOrEqualTo: Timestamp.fromDate(endDate.toUtc()))
//         .snapshots()
//         .map((snapshot) =>
//         snapshot.docs.map((doc) {
//           return ItemInstance.fromJson(doc.data());
//         }).toList());
//   }
//
//   Future<void> deleteItem(Item item) async {
//     return FirebaseFirestore.instance.runTransaction((transaction) async {
//
//       //Get a reference to the items
//       final itemRef = FirebaseFirestore.instance
//           .collection(FirebaseCollections.items)
//           .doc(item.id);
//
//       final instanceRefs = await FirebaseFirestore.instance
//           .collection(FirebaseCollections.itemInstances)
//           .where('itemId', isEqualTo: item.id)
//           .get();
//
//       //Delete instances
//       for (var doc in instanceRefs.docs) {
//         transaction.delete(doc.reference);
//       }
//
//       //Delete the item document
//       transaction.delete(itemRef);
//     });
//   }
//
//   @override
//   Future<void> upsertItem(Item item) async {
//
//     return FirebaseFirestore.instance.runTransaction((transaction) async {
//
//       //Get a reference to the items
//       final itemRef = FirebaseFirestore.instance
//           .collection(FirebaseCollections.items)
//           .doc(item.id);
//
//       final instanceRefs = await FirebaseFirestore.instance
//           .collection(FirebaseCollections.itemInstances)
//           .where('itemId', isEqualTo: item.id)
//           .get();
//
//       //Delete existing instances
//       for (var doc in instanceRefs.docs) {
//         transaction.delete(doc.reference);
//       }
//
//       //Set the new item document
//       transaction.set(itemRef, item.toJson());
//
//       final newInstances = item.generateInstances();
//
//       //Add new instances
//       for(var newInstance in newInstances) {
//         final ref = FirebaseFirestore.instance
//             .collection(FirebaseCollections.itemInstances)
//             .doc(newInstance.itemInstanceId);
//
//         transaction.set(ref, newInstance.toJson());
//       }
//     });
//
//   }
// }
