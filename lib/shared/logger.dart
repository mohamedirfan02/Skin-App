import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart' as logger;

logger.Logger debugLogger = logger.Logger(
  printer: logger.PrettyPrinter(
    printTime: true,
    methodCount: 0,
    noBoxingByDefault: false,
    printEmojis: false,
  ),
);

/// Prints only in debug mode
void debugModePrint(Object? object) {
  if (kDebugMode) {
    debugPrint(object.toString());
  }
}

class UsageWarning {
  final String warningMessage;

  const UsageWarning(this.warningMessage);
}
