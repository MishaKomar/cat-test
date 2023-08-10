import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

class JsonAssetLoader {
  static Future<dynamic> load(String pathToAsset) {
    final completer = Completer();

    rootBundle.loadString(pathToAsset).then((value) {
      completer.complete(jsonDecode(value));
    });

    return completer.future;
  }
}
