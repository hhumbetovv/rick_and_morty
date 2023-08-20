import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../locator.dart';
import '../contractors/base_localization_repository.dart';
import '../failures.dart';
import '../services/local_storage_service.dart';

class LocalizationRepository implements BaseLocalizationRepository {
  final _localStorage = getIt.getAsync<LocalStorageService>();

  @override
  Future<StackFailure?> saveLocale(Locale locale) async {
    try {
      final storage = await _localStorage;
      storage.saveLocale(locale.languageCode);
    } catch (e, s) {
      return StackFailure(e.toString(), s.toString());
    }
    return null;
  }

  @override
  Future<Result<Locale, StackFailure>> get getLocale async {
    final storage = await _localStorage;
    try {
      String? currentLocale = storage.locale;
      if (currentLocale == null) {
        final deviceLocale = Locale(Platform.localeName);
        if (AppLocalizations.supportedLocales.contains(deviceLocale)) {
          currentLocale = deviceLocale.languageCode;
        } else {
          currentLocale = 'en';
        }
      }
      return Success(Locale(currentLocale));
    } catch (e, s) {
      return Error(StackFailure(e.toString(), s.toString()));
    }
  }
}
