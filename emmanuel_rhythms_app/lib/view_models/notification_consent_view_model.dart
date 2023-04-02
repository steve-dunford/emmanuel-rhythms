import 'package:emmanuel_rhythms_app/repositories/analytics_repository.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationConsentViewModel extends ChangeNotifier {
  final AnalyticsRepository _analyticsRepository;

  NotificationConsentViewModel(this._analyticsRepository);

  Future<void> requestNotificationPermission() async {
    if(await Permission.notification.isDenied) {
      final status = await Permission.notification.request();

      _analyticsRepository.track('notification_continue', {
        'granted': status == PermissionStatus.granted ? 'true' : 'false'
      });
    }
  }
}