import 'package:emmanuel_rhythms_cms/repositories/notification_repository.dart';
import 'package:flutter/material.dart';

class SendNotificationViewModel extends ChangeNotifier {

  final NotificationRepository _notificationRepository;

  String _title = '';
  String _body = '';

  SendNotificationViewModel(this._notificationRepository);

  void setTitle(String title) {
    _title = title;
  }

  void setBody(String body) {
    _body = body;
  }

  Future<bool> sendNotification() async {
    if(_title.isEmpty || _body.isEmpty) {
      return false;
    }

    await _notificationRepository.sendNotification(_title, _body);

    return true;
  }
}