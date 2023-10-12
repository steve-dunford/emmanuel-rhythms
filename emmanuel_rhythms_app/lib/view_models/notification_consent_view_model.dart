import 'package:emmanuel_rhythms_app/repositories/analytics_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationConsentViewModel extends ChangeNotifier {
  final AnalyticsRepository _analyticsRepository;

  NotificationConsentViewModel(this._analyticsRepository);

  Future<void> requestNotificationPermission() async {
    if(await Permission.notification.isDenied) {
       final settings = await FirebaseMessaging.instance.requestPermission();

      _analyticsRepository.track('notification_continue', {
        'granted': settings.authorizationStatus == AuthorizationStatus.authorized ? 'true' : 'false'
      });
    }
  }
}