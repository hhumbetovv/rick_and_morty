import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'config/init.dart';
import 'presentation/app.dart';

void main() {
  init();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) {
        return const App();
      },
    ),
  );
}
