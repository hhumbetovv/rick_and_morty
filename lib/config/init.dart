import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/services/character_service.dart';
import '../data/services/episode_service.dart';
import '../data/services/location_service.dart';
import '../locator.dart';

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final locator = Locator.instance;
  final dio = Dio();

  locator.register<CharacterService>(CharacterService(dio));
  locator.register<LocationService>(LocationService(dio));
  locator.register<EpisodeService>(EpisodeService(dio));

  await EasyLocalization.ensureInitialized();
}
