import 'package:zef_log_abstractions/zef_log_abstractions.dart';

class DefaultLogFormatter implements LogFormatter {
  final bool showIcon;
  final bool showTimeStamp;

  DefaultLogFormatter({
    this.showIcon = true,
    this.showTimeStamp = true,
  });

  @override
  String format({
    required LogLevel level,
    required String message,
    required DateTime timestamp,
    String? error,
    StackTrace? stackTrace,
  }) {
    final buffer = StringBuffer();

    if (showIcon) {
      buffer.write(level.icon);
    }

    if (showTimeStamp) {
      buffer.write(' ${timestamp.toIso8601String()}');
    }

    buffer.write(' $message');

    if (error != null) {
      buffer.writeln('Error: $error');
    }

    if (stackTrace != null) {
      buffer.writeln('StackTrace: $stackTrace');
    }

    return buffer.toString();
  }
}
