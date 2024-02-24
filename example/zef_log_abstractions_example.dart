import 'package:zef_log_abstractions/zef_log_abstractions.dart';

void main() {
  // Custom logger configuration
  configureLogger();

  // Log messages at various levels
  logMessages();
}

void configureLogger() {
  // Initialize the logger with default settings
  Logger.I.info(message: 'Starting application with default logger configuration.');

  // Or, configure the logger with custom settings
  // LoggerBuilder()
  //     .withLogLevel(LogLevel.debug) // Set minimum log level to debug
  //     .withAdapter(ConsoleLoggerAdapter()) // Use console logger adapter
  //     .withFormatter(DefaultLogFormatter()) // Use default log formatter
  //     .build();

  Logger.I.debug(message: 'Logger configured with custom settings.');
}

void logMessages() {
  Logger.I.trace(message: 'This is a trace log - very detailed information.');
  Logger.I.debug(message: 'This is a debug log - useful for debugging.');
  Logger.I.info(message: 'This is an info log - general operational events.');
  Logger.I.warning(message: 'This is a warning log - something unexpected happened.');
  Logger.I.error(
      message: 'This is an error log - an error occurred but the application can still continue.',
      error: 'SampleError');
  Logger.I.fatal(
      message: 'This is a fatal log - a critical error occurred, the application might terminate.',
      error: 'CriticalError');
}
