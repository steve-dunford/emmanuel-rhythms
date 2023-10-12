import 'package:cloud_functions/cloud_functions.dart';
import 'package:emmanuel_rhythms_cms/common/network_constants.dart';

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
    } catch(e) {
      print('Failed to register user in Mailchimp: ${e.toString()}');
    }
  }

}