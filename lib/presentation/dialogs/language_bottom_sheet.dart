import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/constants/text_styles.dart';
import 'package:rick_and_morty/presentation/global/components/app_inkwell.dart';

void showLanguageBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return const _SheetBody();
    },
  );
}

class _SheetBody extends StatelessWidget {
  const _SheetBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _TopRow(),
          ...context.supportedLocales.map((locale) {
            return _LocaleSelection(locale: locale);
          }).toList()
        ],
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
    return ListTile(
      onTap: () {
        context.setLocale(locale);
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
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'languageSelection',
            style: TextStyles.cardNameStyle,
          ).tr(),
          AppInkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
