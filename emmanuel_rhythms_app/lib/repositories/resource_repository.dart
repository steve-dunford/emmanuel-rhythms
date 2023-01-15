import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emmanuel_rhythms_app/common/firebase_collections.dart';
import 'package:emmanuel_rhythms_app/models/items/daily_content_instance.dart';
import 'package:emmanuel_rhythms_app/models/items/item.dart';

abstract class ResourceRepository {
  Stream<List<Item>> allResources();
}

class FirebaseResourceRepository extends ResourceRepository {

  //TEMPORARY - not scalable
  @override
  Stream<List<Item>> allResources() {
    return FirebaseFirestore.instance
        .collection(FirebaseCollections.resources)
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) {
          return Item.fromJson(doc.data());
        }).toList());
  }
}
