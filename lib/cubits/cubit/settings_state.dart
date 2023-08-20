part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final Locale locale;
  final StackFailure? failure;
  const SettingsState({
    required this.locale,
    this.failure,
  });

  @override
  List<Object?> get props => [locale, failure];
  SettingsState copyWith({
    Locale? locale,
    StackFailure? failure,
  }) {
    return SettingsState(
      locale: locale ?? this.locale,
      failure: failure,
    );
  }
}
