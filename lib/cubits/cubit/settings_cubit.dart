import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../data/contractors/base_localization_repository.dart';
import '../../data/failures.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this._localizationRepository) : super(const SettingsState(locale: Locale('en')));

  final BaseLocalizationRepository _localizationRepository;

  void initSettings() async {
    final Result localeResult = await _localizationRepository.getLocale;
    if (localeResult.isSuccess()) {
      final Locale locale = localeResult.tryGetSuccess()!;
      emit(state.copyWith(locale: locale));
    } else {
      final StackFailure failure = localeResult.tryGetError()!;
      emit(state.copyWith(failure: failure));
    }
  }

  void setLocale(Locale locale) async {
    final StackFailure? failure = await _localizationRepository.saveLocale(locale);
    if (failure == null) {
      emit(state.copyWith(locale: locale));
    } else {
      emit(state.copyWith(failure: failure));
    }
  }
}
