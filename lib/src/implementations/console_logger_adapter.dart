import 'dart:developer' as developer;

import 'package:zef_log_core/zef_log_core.dart';

class ConsoleLoggerAdapter implements LoggerAdapter {
  @override
  void trace({
    required String message,
    required StackTrace? stackTrace,
    required LogFormatter formatter,
  }) {
    final formattedMessage = formatter.format(
      level: LogLevel.trace,
      message: message,
      timestamp: DateTime.now(),
      stackTrace: stackTrace,
    );
    developer.log(formattedMessage, level: LogLevel.trace.value);
  }

  @override
  void debug({
    required String message,
    required StackTrace? stackTrace,
    required LogFormatter formatter,
  }) {
    final formattedMessage = formatter.format(
      level: LogLevel.debug,
      message: message,
      timestamp: DateTime.now(),
      stackTrace: stackTrace,
    );
    developer.log(formattedMessage, level: LogLevel.debug.value);
  }

  @override
  void info({
    required String message,
    required StackTrace? stackTrace,
    required LogFormatter formatter,
  }) {
    final formattedMessage = formatter.format(
      level: LogLevel.info,
      message: message,
      timestamp: DateTime.now(),
      stackTrace: stackTrace,
    );
    developer.log(formattedMessage, level: LogLevel.info.value);
  }

  @override
  void warning({
    required String message,
    required StackTrace? stackTrace,
    required LogFormatter formatter,
  }) {
    final formattedMessage = formatter.format(
      level: LogLevel.warning,
      message: message,
      timestamp: DateTime.now(),
      stackTrace: stackTrace,
    );
    developer.log(formattedMessage, level: LogLevel.warning.value);
  }

  @override
  void error({
    required String message,
    required String error,
    required StackTrace? stackTrace,
    required LogFormatter formatter,
  }) {
    final formattedMessage = formatter.format(
      level: LogLevel.error,
      message: message,
      timestamp: DateTime.now(),
      error: error,
      stackTrace: stackTrace,
    );
    developer.log(formattedMessage, level: LogLevel.error.value);
  }

  @override
  void fatal({
    required String message,
    required String error,
    required StackTrace? stackTrace,
    required LogFormatter formatter,
  }) {
    final formattedMessage = formatter.format(
      level: LogLevel.fatal,
      message: message,
      timestamp: DateTime.now(),
      error: error,
      stackTrace: stackTrace,
    );
    developer.log(formattedMessage, level: LogLevel.fatal.value);
  }
}
