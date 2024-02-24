# zef_log_core

A versatile and extensible logging framework for Dart applications, providing configurable log levels, custom formatting, and adaptable output options. Designed with flexibility in mind, this package allows developers to easily integrate comprehensive logging into their Dart and Flutter projects.

## Features

- **Configurable Log Levels**: Trace, Debug, Info, Warning, Error, and Fatal to suit various verbosity needs.
- **Custom Log Formatters**: Define how log messages are formatted and displayed.
- **Flexible Log Adapters**: Easily direct log output to various destinations like console, files, or external services.
- **Singleton Logger Instance**: Ensures consistent logging configuration across your application.
- **Extensible Design**: Implement your own formatters and adapters to suit specific requirements.

## Getting Started

To use this package in your Dart project, add it as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  zef_log_core: <latest>
```

## Usage

### Basic Setup

Initialize the logger with default settings:

```dart
import 'package:zef_log_core/zef_log_core.dart';

void main() {
  // Initialize Logger with default settings
  Logger.I.info(message: 'Application started');
}
```

### Custom Configuration

Configure the logger with custom log level, formatter, and adapter:

```dart
LoggerBuilder()
  .withLogLevel(LogLevel.debug)
  .withAdapter(ConsoleLoggerAdapter())
  .withFormatter(CustomLogFormatter())
  .build();

Logger.I.debug(message: 'Custom configuration set');
```

### Logging Messages

Log messages at different levels throughout your application:

```dart
Logger.I.trace(message: 'Detailed trace message');
Logger.I.debug(message: 'Debugging message');
Logger.I.info(message: 'Informational message');
Logger.I.warning(message: 'Warning message');
Logger.I.error(message: 'Error message', error: 'Error details');
Logger.I.fatal(message: 'Fatal error message', error: 'Critical error details');
```

## Extending the code

### Implementing Custom LoggerAdapter

Implement LoggerAdapter to direct logs to a custom destination:

```dart
class MyCustomLoggerAdapter implements LoggerAdapter {
  @override
  void info({required String message, StackTrace? stackTrace, required LogFormatter formatter}) {
    // Custom logic to handle info level logs
  }

  // Implement other methods...
}
```

### Creating Custom LogFormatter

Create a LogFormatter to customize log message format:

```dart
class MyCustomLogFormatter implements LogFormatter {
  @override
  String format({required LogLevel level, required String message, required DateTime timestamp, String? error, StackTrace? stackTrace}) {
    // Return custom formatted string
  }
}
```

## Contributing

Contributions to this package are welcome! Please read our Contributing Guide for more information on how to get started.
