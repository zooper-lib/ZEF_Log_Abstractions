enum LogLevel implements Comparable<LogLevel> {
  trace(name: 'TRACE', value: 100, icon: '🐛'),
  debug(name: 'DEBUG', value: 200, icon: '🐛'),
  info(name: 'INFO', value: 300, icon: 'ℹ️'),
  warning(name: 'WARNING', value: 400, icon: '❗'),
  error(name: 'ERROR', value: 500, icon: '🛑'),
  fatal(name: 'FATAL', value: 600, icon: '🔥');

  const LogLevel({
    required this.name,
    required this.value,
    required this.icon,
  });

  final String name;
  final int value;
  final String icon;

  @override
  int compareTo(LogLevel other) => value - other.value;

  operator <(LogLevel other) => value < other.value;

  operator <=(LogLevel other) => value <= other.value;

  operator >(LogLevel other) => value > other.value;

  operator >=(LogLevel other) => value >= other.value;
}
