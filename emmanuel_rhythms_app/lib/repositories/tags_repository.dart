import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emmanuel_rhythms_app/common/firebase_collections.dart';
import 'package:emmanuel_rhythms_app/models/tag.dart';

abstract class TagsRepository {

  Stream<List<Tag>> tags();
}

class FirebaseTagsRepository extends TagsRepository {

  @override
  Stream<List<Tag>> tags() {
    return FirebaseFirestore.instance
        .collection(FirebaseCollections.tags)
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => Tag.fromJson(doc.data())).toList());
  }
}
