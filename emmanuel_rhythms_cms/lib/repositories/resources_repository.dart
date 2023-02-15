import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emmanuel_rhythms_cms/common/firebase_collections.dart';
import 'package:emmanuel_rhythms_cms/models/items/daily_content.dart';
import 'package:emmanuel_rhythms_cms/models/items/item.dart';
import 'package:emmanuel_rhythms_cms/models/items/daily_content_instance.dart';

abstract class ResourcesRepository {

  Stream<List<Item>> resources();
  Future<void> upsertResource(Item resource);
  Future<void> deleteResource(Item resource);
  Future<void> publishResource(Item resource);
}

class FirebaseResourcesRepository extends ResourcesRepository {

  @override
  Stream<List<Item>> resources() {
    return FirebaseFirestore.instance
        .collection(FirebaseCollections.resources)
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => Item.fromJson(doc.data())).toList());
  }

  @override
  Future<void> upsertResource(Item resource) {
    return FirebaseFirestore.instance
        .collection(FirebaseCollections.resources)
        .doc(resource.id)
        .set(resource.toJson());
  }

  Future<void> deleteResource(Item resource) async {
    await FirebaseFirestore.instance
        .collection(FirebaseCollections.resources)
        .doc(resource.id)
        .delete();

    final published = FirebaseFirestore.instance
        .collection(FirebaseCollections.publishedResources)
        .doc(resource.id);

    if ((await published.get()).exists) {
      await published.delete();
    }
  }

  Future<void> publishResource(Item resource) {
    return FirebaseFirestore.instance
        .collection(FirebaseCollections.publishedResources)
        .doc(resource.id)
        .set(resource.toJson());
  }
}
