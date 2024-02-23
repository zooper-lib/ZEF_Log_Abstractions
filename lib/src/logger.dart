import 'package:zef_log_abstractions/zef_log_abstractions.dart';

import 'implementations/concrete_logger.dart';
import 'implementations/console_logger_adapter.dart';
import 'implementations/default_log_formatter.dart';

abstract class Logger {
  static Logger? _instance;

  static Logger get instance {
    _instance ??= _createDefaultLogger();
    return _instance!;
  }

  static Logger get I => instance;

  LogLevel? get minimumLogLevel;
  LoggerAdapter get adapter;
  LogFormatter get formatter;

  set minimumLogLevel(LogLevel? level);
  set adapter(LoggerAdapter adapter);
  set formatter(LogFormatter formatter);

  void trace({
    required String message,
    StackTrace? stackTrace,
  });

  void debug({
    required String message,
    StackTrace? stackTrace,
  });

  void info({
    required String message,
    StackTrace? stackTrace,
  });

  void warning({
    required String message,
    StackTrace? stackTrace,
  });

  void error({
    required String message,
    required String error,
    StackTrace? stackTrace,
  });

  void fatal({
    required String message,
    required String error,
    StackTrace? stackTrace,
  });

  bool shouldLog(LogLevel level);

  static Logger _createDefaultLogger() {
    return ConcreteLogger(
      ConsoleLoggerAdapter(),
      LogLevel.warning,
      DefaultLogFormatter(),
    )..warning(
        message: 'Logger is using the default configuration. Please initialize it properly for full functionality.',
        stackTrace: StackTrace.current,
      );
  }
}

class LoggerBuilder {
  LogLevel _minimumLogLevel = LogLevel.info;
  LoggerAdapter _adapter = ConsoleLoggerAdapter();
  LogFormatter _formatter = DefaultLogFormatter();

  LoggerBuilder withLogLevel(LogLevel logLevel) {
    _minimumLogLevel = logLevel;
    return this;
  }

  LoggerBuilder withAdapter(LoggerAdapter adapter) {
    _adapter = adapter;
    return this;
  }

  LoggerBuilder withFormatter(LogFormatter formatter) {
    _formatter = formatter;
    return this;
  }

  Logger build() {
    if (Logger._instance != null) {
      throw StateError('$Logger has already been initialized and cannot be configured again.');
    }

    Logger._instance = ConcreteLogger(
      _adapter,
      _minimumLogLevel,
      _formatter,
    );

    return Logger.I;
  }
}
