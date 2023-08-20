import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageService {
  static late final Box _localStorage;
  final _localeKey = 'localeKey';

  static Future<LocalStorageService> initialize() async {
    if (!Hive.isBoxOpen('preferencesBox')) {
      _localStorage = await Hive.openBox('preferencesBox');
    }

    return LocalStorageService();
  }

  Future<void> saveLocale(String localeValue) {
    return _localStorage.put(_localeKey, localeValue);
  }

  String? get locale => _localStorage.get(_localeKey);
}
