import 'package:zef_log_core/zef_log_core.dart';

/// `LogFormatter` defines an interface for formatting log messages. Implementations
/// of this class should convert log messages and their associated data (such as log
/// level, timestamp, error information, and stack traces) into a string format suitable
/// for display or storage. This allows for customizable log message layouts and the
/// inclusion of relevant information as needed.
abstract class LogFormatter {
  /// Formats a log message into a string based on the given parameters. This method
  /// should organize the log level, message, timestamp, and any error or stack trace
  /// information into a coherent and readable format.
  ///
  /// Parameters:
  /// - `level`: The [LogLevel] of the message, indicating its severity.
  /// - `message`: The main log message content.
  /// - `timestamp`: The [DateTime] when the log message was created, providing temporal context.
  /// - `error`: An optional error message if the log is associated with an error.
  /// - `stackTrace`: An optional [StackTrace] providing more context about where the error occurred.
  ///
  /// Returns a formatted string representing the log message, ready for output.
  String format({
    required LogLevel level,
    required String message,
    required DateTime timestamp,
    String? error,
    StackTrace? stackTrace,
  });
}
