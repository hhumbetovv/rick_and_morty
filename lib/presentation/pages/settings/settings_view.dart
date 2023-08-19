// ignore_for_file: prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/constants/text_styles.dart';
import 'package:rick_and_morty/presentation/global/components/go_back_button.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  void localeCallBack(Locale locale) {
    setState(() {
      context.setLocale(locale);
    });
  }

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
                GoBackButton(),
                _TopRow(),
                ...context.supportedLocales.map((locale) {
                  return _LocaleSelection(
                    locale: locale,
                    localeCallBack: localeCallBack,
                  );
                }).toList()
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
    required this.localeCallBack,
  }) : super(key: key);

  final Locale locale;
  final void Function(Locale locale) localeCallBack;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: ListTile(
        onTap: () {
          localeCallBack(locale);
        },
        title: Text(locale.toString().tr()),
        subtitle: Text(
          'lang_${locale.toString()}'.tr(),
        ),
        contentPadding: EdgeInsets.zero,
        leading: Radio<Locale>(
          value: locale,
          groupValue: context.locale,
          onChanged: (Locale? value) {
            context.setLocale(locale);
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: const Text(
        'languageSelection',
        style: TextStyles.cardNameStyle,
      ).tr(),
    );
  }
}
