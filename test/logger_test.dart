import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:zef_log_core/zef_log_core.dart';

import 'logger_test.mocks.dart';

@GenerateMocks([LoggerAdapter, LogFormatter])
void main() {
  group('Logger functionality', () {
    late MockLoggerAdapter mockAdapter;
    late MockLogFormatter mockFormatter;

    setUpAll(() {
      mockAdapter = MockLoggerAdapter();
      mockFormatter = MockLogFormatter();

      LoggerBuilder().withLogLevel(LogLevel.info).withAdapter(mockAdapter).withFormatter(mockFormatter).build();
    });

    test('should throw when attempting to reconfigure Logger after initialization', () {
      expect(() => LoggerBuilder().withLogLevel(LogLevel.debug).build(), throwsA(isA<StateError>()));
    });

    test('should pass log message to adapter at correct level', () {
      final testMessage = 'Info level message';
      final testStackTrace = StackTrace.current;

      Logger.I.info(message: testMessage, stackTrace: testStackTrace);

      // Verify that `adapter.info` was called with the expected arguments
      verify(mockAdapter.info(
        message: anyNamed('message'),
        stackTrace: anyNamed('stackTrace'),
        formatter: anyNamed('formatter'),
      )).called(1);
    });

    test('should not log messages below the configured log level', () {
      final debugMessage = 'Debug level message';

      // LogLevel is set to info, so debug messages should not be logged
      Logger.I.debug(message: debugMessage);
      verifyNever(mockAdapter.debug(
        message: anyNamed('message'),
        stackTrace: anyNamed('stackTrace'),
        formatter: anyNamed('formatter'),
      ));
    });

    test('should log error with message, error, and stack trace', () {
      final errorMessage = 'Error occurred';
      final errorDetail = 'Error detail';
      final stackTrace = StackTrace.current;

      Logger.I.error(message: errorMessage, error: errorDetail, stackTrace: stackTrace);

      verify(mockAdapter.error(
        message: anyNamed('message'),
        error: errorDetail,
        stackTrace: stackTrace,
        formatter: anyNamed('formatter'),
      )).called(1);
    });

    test('should log fatal with message, error, and stack trace', () {
      final fatalMessage = 'Fatal error occurred';
      final fatalErrorDetail = 'Fatal error detail';
      final stackTrace = StackTrace.current;

      Logger.I.fatal(message: fatalMessage, error: fatalErrorDetail, stackTrace: stackTrace);

      verify(mockAdapter.fatal(
        message: anyNamed('message'),
        error: fatalErrorDetail,
        stackTrace: stackTrace,
        formatter: anyNamed('formatter'),
      )).called(1);
    });
  });
}
