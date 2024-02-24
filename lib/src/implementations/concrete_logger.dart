import 'package:zef_log_core/zef_log_core.dart';

class ConcreteLogger implements Logger {
  LogLevel? _minimumLogLevel;
  LoggerAdapter _adapter;
  LogFormatter _formatter;

  ConcreteLogger(
    this._adapter,
    this._minimumLogLevel,
    this._formatter,
  );

  @override
  LogLevel? get minimumLogLevel => _minimumLogLevel;

  @override
  LoggerAdapter get adapter => _adapter;

  @override
  LogFormatter get formatter => _formatter;

  @override
  set minimumLogLevel(LogLevel? level) {
    _minimumLogLevel = level;
  }

  @override
  set adapter(LoggerAdapter adapter) {
    _adapter = adapter;
  }

  @override
  set formatter(LogFormatter formatter) {
    _formatter = formatter;
  }

  @override
  void trace({required String message, StackTrace? stackTrace}) {
    if (shouldLog(LogLevel.trace)) {
      _adapter.trace(
        message: message,
        stackTrace: stackTrace,
        formatter: _formatter,
      );
    }
  }

  @override
  void debug({
    required String message,
    StackTrace? stackTrace,
  }) {
    if (shouldLog(LogLevel.debug)) {
      _adapter.debug(
        message: message,
        stackTrace: stackTrace,
        formatter: _formatter,
      );
    }
  }

  @override
  void info({
    required String message,
    StackTrace? stackTrace,
  }) {
    if (shouldLog(LogLevel.info)) {
      _adapter.info(
        message: message,
        stackTrace: stackTrace,
        formatter: _formatter,
      );
    }
  }

  @override
  void warning({
    required String message,
    StackTrace? stackTrace,
  }) {
    if (shouldLog(LogLevel.warning)) {
      _adapter.warning(
        message: message,
        stackTrace: stackTrace,
        formatter: _formatter,
      );
    }
  }

  @override
  void error(
      {required String message,
      required String error,
      StackTrace? stackTrace}) {
    if (shouldLog(LogLevel.error)) {
      _adapter.error(
        message: message,
        error: error,
        stackTrace: stackTrace,
        formatter: _formatter,
      );
    }
  }

  @override
  void fatal({
    required String message,
    required String error,
    StackTrace? stackTrace,
  }) {
    if (shouldLog(LogLevel.fatal)) {
      _adapter.fatal(
        message: message,
        error: error,
        stackTrace: stackTrace,
        formatter: _formatter,
      );
    }
  }

  @override
  bool shouldLog(LogLevel level) {
    return minimumLogLevel != null && level >= minimumLogLevel!;
  }
}
