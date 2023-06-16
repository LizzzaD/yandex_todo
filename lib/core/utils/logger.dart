import 'dart:developer';

class Logger {
  Logger._();

  static void l([Object? msg, Object? e, StackTrace? s]) {
    log(
      msg.toString(),
      name: e == null ? 'INFO' : 'ERROR',
      error: e,
      stackTrace: s,
    );
  }
}