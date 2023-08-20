import 'package:flutter/material.dart';
import 'package:multiple_result/multiple_result.dart';

import '../failures.dart';

abstract class BaseLocalizationRepository {
  Future<StackFailure?> saveLocale(Locale locale);

  Future<Result<Locale, StackFailure>> get getLocale;
}
