import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nanoid2/nanoid2.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Analytics {
  static Future<String> get installId async {
    final prefs = await SharedPreferences.getInstance();

    final currentId = prefs.getString('install-id');

    if (currentId != null && !currentId.contains("-")) {
      return currentId;
    } else {
      final newId = nanoid();
      prefs.setString('install-id', newId);
      return newId;
    }
  }

  static final sessionId = nanoid();

  static void _e(String name, [Map<String, dynamic> props = const {}]) async {
    if (kDebugMode) {
      debugPrint('[analytics] $name, $props');
    }
    await http.post(
      Uri.https('analytics.pighetti.dev', 'api/collections/analytics/records'),
      headers: {
        'Content-Type': 'application/json',
        'Key': 'Mv2BLHxeB1QVLtAld4ts6',
      },
      body: jsonEncode(
        {
          "app": "struggle-switch",
          "debug": kDebugMode,
          "event": name,
          "distinct_id": await installId,
          "session_id": sessionId,
          "properties": props,
          "timestamp": DateTime.now().toUtc().toIso8601String(),
        },
      ),
    );
  }

  static void openApp() => _e('open_app');
  static void tapNotStruggling() => _e('tap_not_struggling');
  static void tapStartOver() => _e('tap_start_over');
  static void tapWatchVideo() => _e('tap_watch_video');
  static void tapViewCreator() => _e('tap_view_creator');
  static void tapViewRepository() => _e('tap_view_repository');
}
