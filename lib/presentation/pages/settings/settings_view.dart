import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constants/text_styles.dart';
import '../../../cubits/cubit/settings_cubit.dart';
import '../../../l10n/language_local.dart';
import '../../global/components/go_back_button.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GoBackButton(),
                const _TopRow(),
                ...AppLocalizations.supportedLocales.map((locale) {
                  return _LocaleSelection(locale: locale);
                }).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LocaleSelection extends StatelessWidget {
  const _LocaleSelection({
    Key? key,
    required this.locale,
  }) : super(key: key);

  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: ListTile(
        onTap: () {
          context.read<SettingsCubit>().setLocale(locale);
        },
        title: Text(LanguageLocal.getDisplayLanguage(locale.languageCode).nativeName),
        subtitle: Text(LanguageLocal.getDisplayLanguage(locale.languageCode).name),
        contentPadding: EdgeInsets.zero,
        leading: Radio<Locale>(
          value: locale,
          groupValue: context.watch<SettingsCubit>().state.locale,
          onChanged: (Locale? value) {
            context.read<SettingsCubit>().setLocale(locale);
          },
        ),
      ),
    );
  }
}

class _TopRow extends StatelessWidget {
  const _TopRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        l10n.languageSelection,
        style: TextStyles.cardNameStyle,
      ),
    );
  }
}
