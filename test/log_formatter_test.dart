import 'package:test/test.dart';
import 'package:zef_log_abstractions/src/implementations/default_log_formatter.dart';
import 'package:zef_log_abstractions/zef_log_abstractions.dart';

void main() {
  group('LogFormatter formatting', () {
    test('should format log message correctly', () {
      final formatter = DefaultLogFormatter();
      final result = formatter.format(
        level: LogLevel.info,
        message: 'Test message',
        timestamp: DateTime(2020, 1, 1, 12, 0),
        error: null,
        stackTrace: null,
      );

      // Assuming your formatter includes the level, message, and timestamp
      expect(result, contains(LogLevel.info.icon));
      expect(result, contains('Test message'));
      expect(result, contains(DateTime(2020, 1, 1, 12, 0, 0).toIso8601String()));
    });
  });
}
