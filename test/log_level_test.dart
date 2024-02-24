import 'package:test/test.dart';
import 'package:zef_log_core/zef_log_core.dart';

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
