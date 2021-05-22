import 'package:logger/logger.dart';

class LoggerDefault {
  static Logger? _logger;

  static Logger  get log {
    if (_logger == null) {
      _logger = Logger( printer: PrettyPrinter(
          methodCount: 1, // number of method calls to be displayed
          errorMethodCount: 5, // number of method calls if stacktrace is provided
          lineLength: 500, // width of the output
          colors: false, // Colorful log messages
          printEmojis: true, // Print an emoji for each log message
          printTime: true // Should each log print contain a timestamp
      ),);
    }
    return _logger!;
  }
}