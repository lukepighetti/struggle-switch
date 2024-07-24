import 'package:flutter/foundation.dart';
import 'package:posthog_flutter/posthog_flutter.dart';

class Analytics {
  static final _p = Posthog();

  static void _e(String name) {
    if (kDebugMode) debugPrint('[analytics] $name');
    _p.capture(eventName: name);
  }

  static void tapNotStruggling() => _e('tap-not-struggling');
  static void tapStartOver() => _e('tap-start-over');
  static void tapWatchVideo() => _e('tap-watch-video');
  static void tapViewCreator() => _e('tap-view-creator');
  static void tapViewRepository() => _e('tap-view-repository');
}
