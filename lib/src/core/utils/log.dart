import 'dart:developer';

class Log {
  static void d(dynamic content) {
    log('[LOG]: $content');
  }

  static void s(dynamic content) {
    log('[SUCCESS]: $content');
  }

  static void e(dynamic content) {
    log('[ERROR]: $content');
  }
}
