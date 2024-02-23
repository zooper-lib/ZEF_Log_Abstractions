import 'package:zef_log_abstractions/zef_log_abstractions.dart';

abstract class LoggerAdapter {
  void trace({
    required String message,
    required StackTrace? stackTrace,
    required LogFormatter formatter,
  });

  void debug({
    required String message,
    required StackTrace? stackTrace,
    required LogFormatter formatter,
  });

  void info({
    required String message,
    required StackTrace? stackTrace,
    required LogFormatter formatter,
  });

  void warning({
    required String message,
    required StackTrace? stackTrace,
    required LogFormatter formatter,
  });

  void error({
    required String message,
    required String error,
    required StackTrace? stackTrace,
    required LogFormatter formatter,
  });

  void fatal({
    required String message,
    required String error,
    required StackTrace? stackTrace,
    required LogFormatter formatter,
  });
}
