import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'config/init.dart';
import 'presentation/app.dart';

void main() async {
  await init();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) {
        return EasyLocalization(
          supportedLocales: const [
            Locale("en", "US"),
            Locale("tr", "TR"),
            Locale("az", "AZ"),
          ],
          path: 'assets/translations',
          fallbackLocale: const Locale('en', 'US'),
          child: const App(),
        );
      },
    ),
  );
}