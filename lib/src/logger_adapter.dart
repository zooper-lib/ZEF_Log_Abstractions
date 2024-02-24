import 'package:zef_log_core/zef_log_core.dart';

/// `LoggerAdapter` serves as an abstract base for implementing various logging
/// output mechanisms. It defines a set of methods corresponding to different
/// log levels, each accepting log messages, optional stack traces, and a formatter
/// to format the log output. Implementers of this class can direct log output
/// to various destinations such as the console, files, databases, or external
/// logging services.
///
/// Implementations should override the methods to handle the formatted log
/// messages in a manner appropriate to the target output medium.
abstract class LoggerAdapter {
  /// Logs a message at the trace level. Trace logs are highly detailed and used
  /// for granular debugging. Implementations should format and direct these
  /// messages to the intended output.
  ///
  /// - `message`: The log message to output.
  /// - `stackTrace`: An optional stack trace providing additional context.
  /// - `formatter`: The [LogFormatter] to format the log message.
  void trace({
    required String message,
    required StackTrace? stackTrace,
    required LogFormatter formatter,
  });

  /// Logs a message at the debug level. Debug logs are useful during development
  /// for general debugging. Implementations should format and direct these
  /// messages to the intended output.
  ///
  /// - `message`: The log message to output.
  /// - `stackTrace`: An optional stack trace providing additional context.
  /// - `formatter`: The [LogFormatter] to format the log message.
  void debug({
    required String message,
    required StackTrace? stackTrace,
    required LogFormatter formatter,
  });

  /// Logs a message at the info level. Info logs convey general operational
  /// information about the application's state. Implementations should format
  /// and direct these messages to the intended output.
  ///
  /// - `message`: The log message to output.
  /// - `stackTrace`: An optional stack trace providing additional context.
  /// - `formatter`: The [LogFormatter] to format the log message.
  void info({
    required String message,
    required StackTrace? stackTrace,
    required LogFormatter formatter,
  });

  /// Logs a message at the warning level. Warning logs indicate potential issues
  /// or unexpected events. Implementations should format and direct these messages
  /// to the intended output.
  ///
  /// - `message`: The log message to output.
  /// - `stackTrace`: An optional stack trace providing additional context.
  /// - `formatter`: The [LogFormatter] to format the log message.
  void warning({
    required String message,
    required StackTrace? stackTrace,
    required LogFormatter formatter,
  });

  /// Logs a message at the error level. Error logs signify issues that have
  /// occurred but may not necessarily halt application execution. Implementations
  /// should format and direct these messages to the intended output.
  ///
  /// - `message`: The log message to output.
  /// - `error`: A string representation of the error encountered.
  /// - `stackTrace`: An optional stack trace providing additional context.
  /// - `formatter`: The [LogFormatter] to format the log message.
  void error({
    required String message,
    required String error,
    required StackTrace? stackTrace,
    required LogFormatter formatter,
  });

  /// Logs a message at the fatal level. Fatal logs represent critical issues that
  /// are likely to terminate application execution. Implementations should format
  /// and direct these messages to the intended output with high priority.
  ///
  /// - `message`: The log message to output.
  /// - `error`: A string representation of the severe error encountered.
  /// - `stackTrace`: An optional stack trace providing additional context.
  /// - `formatter`: The [LogFormatter] to format the log message.
  void fatal({
    required String message,
    required String error,
    required StackTrace? stackTrace,
    required LogFormatter formatter,
  });
}
