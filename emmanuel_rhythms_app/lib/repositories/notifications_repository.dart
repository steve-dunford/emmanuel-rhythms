import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emmanuel_rhythms_app/common/firebase_collections.dart';
import 'package:emmanuel_rhythms_app/models/notification.dart'
    as er_notifications;

abstract class NotificationsRepository {
  Stream<List<er_notifications.Notification>> recentNotifications();
}

class FirebaseNotificationsRepository extends NotificationsRepository {
  static const recentNotificationLimit = 20;

  @override
  Stream<List<er_notifications.Notification>> recentNotifications() {
    return FirebaseFirestore.instance
        .collection(FirebaseCollections.notifications)
        .orderBy('timestamp')
        .limit(recentNotificationLimit)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              return er_notifications.Notification.fromJson(doc.data());
            }).toList());
  }
}
