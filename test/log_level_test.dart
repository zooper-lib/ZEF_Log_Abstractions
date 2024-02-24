import 'package:test/test.dart';
import 'package:zef_log_abstractions/zef_log_abstractions.dart';

void main() {
  group('LogLevel comparison', () {
    test('should correctly compare log levels', () {
      expect(LogLevel.trace < LogLevel.debug, isTrue);
      expect(LogLevel.error > LogLevel.warning, isTrue);
      expect(LogLevel.fatal >= LogLevel.error, isTrue);
      expect(LogLevel.info <= LogLevel.warning, isTrue);
    });
  });
}
