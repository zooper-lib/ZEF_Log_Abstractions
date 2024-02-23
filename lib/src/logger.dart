import 'package:zef_log_abstractions/zef_log_abstractions.dart';

import 'implementations/concrete_logger.dart';
import 'implementations/console_logger_adapter.dart';
import 'implementations/default_log_formatter.dart';

/// [Logger] serves as a flexible and configurable logging utility designed to support
/// various logging levels and formats. It follows the Singleton pattern to ensure a
/// consistent logging mechanism throughout the application. This class allows for detailed
/// logging control, including setting minimum log levels, customizing log message formats,
/// and specifying log output destinations through adapters.
///
/// To use the logger:
/// ```dart
/// Logger.I.info(message: 'Application initialization complete.');
/// ```
///
/// To customize the logger, consider using [LoggerBuilder] before accessing [Logger.I]
/// for the first time.
abstract class Logger {
  static Logger? _instance;

  /// Provides a global access point to the singleton instance of [Logger]. If not previously
  /// instantiated, it will initialize with default settings. Prefer using [Logger.I] for
  /// concise access.
  ///
  /// Returns the singleton [Logger] instance.
  static Logger get instance {
    _instance ??= _createDefaultLogger();
    return _instance!;
  }

  /// A convenient alias for [instance], providing shorthand access to the singleton [Logger].
  static Logger get I => instance;

  /// The minimum level of log messages that will be processed. Messages below this level
  /// will be ignored. This allows for runtime control over logging verbosity.
  LogLevel? get minimumLogLevel;
  set minimumLogLevel(LogLevel? level);

  /// The current [LoggerAdapter] in use, which directs the formatted log messages to
  /// a specific output, such as console, file, or network. Changing the adapter allows
  /// for flexible redirection of log output.
  LoggerAdapter get adapter;
  set adapter(LoggerAdapter adapter);

  /// The [LogFormatter] responsible for converting log messages and their associated
  /// data into a specific format. Custom formatters can be set to modify log message
  /// appearance.
  LogFormatter get formatter;
  set formatter(LogFormatter formatter);

  /// Logs a message at the trace level, which is the most verbose level used for
  /// detailed debugging information. Trace logs are ideal for understanding the
  /// flow and state of the application.
  ///
  /// - `message`: The log message to output.
  /// - `stackTrace`: An optional stack trace providing additional context.
  void trace({
    required String message,
    StackTrace? stackTrace,
  });

  /// Logs a message at the debug level, a notch above trace, useful for general
  /// debugging and development information that's less verbose than trace.
  ///
  /// - `message`: The log message to output.
  /// - `stackTrace`: An optional stack trace providing additional context.
  void debug({
    required String message,
    StackTrace? stackTrace,
  });

  /// Logs a message at the info level, intended for informational messages that
  /// highlight the application's progress and significant state changes.
  ///
  /// - `message`: The log message to output.
  /// - `stackTrace`: An optional stack trace providing additional context.
  void info({
    required String message,
    StackTrace? stackTrace,
  });

  /// Logs a message at the warning level, suitable for situations that are not
  /// errors but may warrant caution or further investigation.
  ///
  /// - `message`: The log message to output.
  /// - `stackTrace`: An optional stack trace providing additional context.
  void warning({
    required String message,
    StackTrace? stackTrace,
  });

  /// Logs a message at the error level, indicating an issue that has occurred,
  /// but the application can still continue running. Error logs are critical for
  /// identifying issues that need attention.
  ///
  /// - `message`: The log message to output.
  /// - `error`: A string representation of the error encountered.
  /// - `stackTrace`: An optional stack trace providing additional context.
  void error({
    required String message,
    required String error,
    StackTrace? stackTrace,
  });

  /// Logs a message at the fatal level, used for severe errors that will likely
  /// cause the application to terminate. Fatal logs represent the most critical
  /// level of logging.
  ///
  /// - `message`: The log message to output.
  /// - `error`: A string representation of the error encountered.
  /// - `stackTrace`: An optional stack trace providing additional context.
  void fatal({
    required String message,
    required String error,
    StackTrace? stackTrace,
  });

  /// Determines if a log message of a given [level] should be logged, based on the
  /// current [minimumLogLevel]. This method facilitates log level filtering.
  ///
  /// - `level`: The [LogLevel] of the message to be potentially logged.
  ///
  /// Returns `true` if the message should be logged, `false` otherwise.
  bool shouldLog(LogLevel level);

  /// Initializes the default logger with a console adapter, warning level,
  /// and default formatting. This method is called if the logger is accessed
  /// without prior configuration and serves as a fallback.
  ///
  /// Emits a warning to encourage proper initialization.
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

/// `LoggerBuilder` provides a fluent interface for constructing and configuring
/// a [Logger] instance. It allows for setting the minimum log level, choosing a
/// specific log adapter, and defining a custom log message formatter.
///
/// This builder ensures that the logger is configured to suit specific logging
/// requirements before it is used throughout the application. Once the builder
/// configures a [Logger], the same configuration and instance can be accessed
/// globally via `Logger.I`.
///
/// Example usage:
/// ```dart
/// LoggerBuilder()
///   .withLogLevel(LogLevel.debug)
///   .withAdapter(CustomLoggerAdapter())
///   .withFormatter(CustomLogFormatter())
///   .build();
///
/// Logger.I.debug(message: 'Logger configured with custom settings.');
/// ```
class LoggerBuilder {
  LogLevel _minimumLogLevel = LogLevel.info;
  LoggerAdapter _adapter = ConsoleLoggerAdapter();
  LogFormatter _formatter = DefaultLogFormatter();

  /// Sets the minimum [LogLevel] for the logger. Logs below this level will not
  /// be processed or output. This allows for control over the verbosity of log
  /// messages that are recorded or displayed.
  ///
  /// - `logLevel`: The minimum [LogLevel] to log.
  /// - Returns the [LoggerBuilder] instance for method chaining.
  LoggerBuilder withLogLevel(LogLevel logLevel) {
    _minimumLogLevel = logLevel;
    return this;
  }

  /// Specifies the [LoggerAdapter] to use for outputting log messages. Different
  /// adapters can direct log output to various destinations such as the console,
  /// files, or external logging services.
  ///
  /// - `adapter`: The [LoggerAdapter] instance to use.
  /// - Returns the [LoggerBuilder] instance for method chaining.
  LoggerBuilder withAdapter(LoggerAdapter adapter) {
    _adapter = adapter;
    return this;
  }

  /// Sets the [LogFormatter] for formatting log messages. Custom formatters can
  /// provide different formats for log messages, such as including timestamps,
  /// log levels, or other contextual information.
  ///
  /// - `formatter`: The [LogFormatter] instance to use.
  /// - Returns the [LoggerBuilder] instance for method chaining.
  LoggerBuilder withFormatter(LogFormatter formatter) {
    _formatter = formatter;
    return this;
  }

  /// Finalizes the configuration of the [Logger] and ensures that it is ready
  /// for use throughout the application. This method should be called once,
  /// typically during application initialization, before any log messages are
  /// recorded.
  ///
  /// Throws [StateError] if the [Logger] has already been initialized.
  ///
  /// - Returns the configured [Logger] instance, accessible globally via `Logger.I`.
  Logger build() {
    if (Logger._instance != null) {
      throw StateError('Logger has already been initialized and cannot be configured again.');
    }

    Logger._instance = ConcreteLogger(
      _adapter,
      _minimumLogLevel,
      _formatter,
    );

    return Logger.I;
  }
}
