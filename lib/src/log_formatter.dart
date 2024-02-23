import 'package:zef_log_abstractions/zef_log_abstractions.dart';

abstract class LogFormatter {
  String format({
    required LogLevel level,
    required String message,
    required DateTime timestamp,
    String? error,
    StackTrace? stackTrace,
  });
}
