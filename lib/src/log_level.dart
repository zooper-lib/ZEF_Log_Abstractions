/// Defines the severity levels for logging, each associated with a specific
/// integer value and an icon for easy identification. The levels include:
/// - `trace`: Very detailed information, useful for debugging the most
///   challenging problems. Least severe.
/// - `debug`: Detailed information on the flow through the system.
/// - `info`: Interesting runtime events (startup/shutdown), should be
///   informative and not verbose.
/// - `warning`: Use of deprecated APIs, poor use of API, 'almost' errors,
///   or other undesirable or unexpected events.
/// - `error`: Runtime errors or unexpected conditions. Often indicates
///   that something is seriously wrong.
/// - `fatal`: Severe errors that cause premature termination. Most severe.
///
/// Each level is associated with a specific `value` to facilitate comparison
/// and a unique `icon` for visual distinction in log outputs.
///
/// This enum implements [Comparable] to allow comparison of different log levels,
/// enabling filtering and threshold checks in logging frameworks.
enum LogLevel implements Comparable<LogLevel> {
  /// Trace level: Very detailed debugging information to diagnose problems with high granularity.
  /// Ideal for understanding the flow and state in complex scenarios.
  trace(name: 'TRACE', value: 100, icon: '🔍'),

  /// Debug level: Detailed information useful during software development and debugging.
  /// Less verbose than trace.
  debug(name: 'DEBUG', value: 200, icon: '🐛'),

  /// Info level: General information about the application's operation.
  info(name: 'INFO', value: 300, icon: 'ℹ️'),

  /// Warning level: Indicates potential issues or unexpected events.
  warning(name: 'WARNING', value: 400, icon: '❗'),

  /// Error level: Errors or unexpected conditions that might not stop the application.
  error(name: 'ERROR', value: 500, icon: '🛑'),

  /// Fatal level: Severe errors causing application termination.
  fatal(name: 'FATAL', value: 600, icon: '🔥');

  const LogLevel({
    required this.name,
    required this.value,
    required this.icon,
  });

  ///The name of the log level, used for display and identification in logs.
  final String name;

  /// The value of the log level, determining its order and importance relative to others.
  final int value;

  /// The icon representing the log level, adding a visual cue to log messages.
  final String icon;

  @override
  // Compares this LogLevel to another, based on their numerical values.
  int compareTo(LogLevel other) => value - other.value;

  // Operator overloads allow for direct comparison of LogLevel instances.
  operator <(LogLevel other) => value < other.value;
  operator <=(LogLevel other) => value <= other.value;
  operator >(LogLevel other) => value > other.value;
  operator >=(LogLevel other) => value >= other.value;
}
