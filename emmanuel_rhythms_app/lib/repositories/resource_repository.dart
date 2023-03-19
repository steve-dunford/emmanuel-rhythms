import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emmanuel_rhythms_app/common/firebase_collections.dart';
import 'package:emmanuel_rhythms_app/models/items/item.dart';
import 'package:emmanuel_rhythms_app/models/resource_category.dart';

abstract class ResourceRepository {
  Stream<List<Item>> allResources();

  Stream<List<Item>> resourcesForCategory(ResourceCategory category);
}

class FirebaseResourceRepository extends ResourceRepository {
  //TEMPORARY - not scalable
  @override
  Stream<List<Item>> allResources() {
    return FirebaseFirestore.instance
        .collection(FirebaseCollections.publishedResources)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              return Item.fromJson(doc.data());
            }).toList());
  }

  @override
  Stream<List<Item>> resourcesForCategory(ResourceCategory category) {
    final resources = FirebaseFirestore.instance
        .collection(FirebaseCollections.publishedResources);

    final filtered = category.tag != null
        ? resources.where('tags', arrayContains: category.tag!.toJson())
        : resources.where('tags', isEqualTo: []);

    return filtered.snapshots().map((snapshot) => snapshot.docs.map((doc) {
          return Item.fromJson(doc.data());
        }).toList());
  }
}
