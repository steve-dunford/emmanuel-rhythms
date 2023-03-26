import 'package:firebase_analytics/firebase_analytics.dart';

abstract class AnalyticsRepository {
  track(String eventName, Map<String, Object>? params);
}

class FirebaseAnalyticsRepository extends AnalyticsRepository {
  @override
  track(String eventName, Map<String, Object>? params) {
    FirebaseAnalytics.instance.logEvent(name: eventName, parameters: params);
  }

}


