import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:emmanuel_rhythms_cms/common/firebase_collections.dart';
import 'package:emmanuel_rhythms_cms/common/network_constants.dart';
import 'package:emmanuel_rhythms_cms/models/notification.dart' as er_notifications;
import 'package:uuid/uuid.dart';

abstract class NotificationRepository {
  Future<void> sendNotification(String title, String body);
}

class FirebaseNotificationRepository extends NotificationRepository {

  @override
  Future<void> sendNotification(String title, String body) async {
    try {
      await FirebaseFunctions.instanceFor(region: NetworkConstants.serverRegion)
          .httpsCallable(NetworkConstants.sendNotification)(<String, dynamic>{
        'title': title,
        'body': body
      });

      await upsertNotification(title, body);
    } catch(e) {
      print('Failed to send notification: ${e.toString()}');
    }
  }

  Future<void> upsertNotification(String title, String body) {
    final notification = er_notifications.Notification(
      id: const Uuid().v4().toString(),
        title: title,
        text: body,
        timestamp: DateTime.now());

    return FirebaseFirestore.instance
        .collection(FirebaseCollections.notifications)
        .doc(notification.id)
        .set(notification.toJson());
  }

}