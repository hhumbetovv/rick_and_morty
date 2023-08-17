import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/services/char_service.dart';
import '../data/services/ep_service.dart';
import '../data/services/loc_service.dart';
import '../locator.dart';

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final locator = Locator.instance;
  final dio = Dio();

  locator.register<CharService>(CharService(dio));
  locator.register<LocService>(LocService(dio));
  locator.register<EpService>(EpService(dio));

  await EasyLocalization.ensureInitialized();
}
