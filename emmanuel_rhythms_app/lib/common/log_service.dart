// ignore_for_file: avoid_print
import 'package:flutter/foundation.dart';

abstract class LogService {
  void debug(String message);

  void warn(String message, {dynamic error});

  void error(String message, {dynamic error});
}

class DebugPrintLogService implements LogService {
  @override
  void debug(String message) {
    if (kDebugMode) {
      print('DBG: $message');
    }
  }

  @override
  void error(String message, {dynamic error}) {
    if (kDebugMode) {
      if (error != null) {
        print('ERR: $message: ${error.toString()}');
      } else {
        print('ERR: $message');
      }
    }
  }

  @override
  void warn(String message, {dynamic error}) {
    error ?? Exception(message);

    if (kDebugMode) {
      if (error != null) {
        print('WARN: $message: ${error.toString()}');
      } else {
        print('WARN: $message');
      }
    }
  }
}
