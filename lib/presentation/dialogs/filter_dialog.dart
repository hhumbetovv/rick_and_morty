import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../constants/text_styles.dart';
import '../../data/models/filters/char_filter.dart';
import '../global/components/app_button.dart';
import '../global/components/app_dropdown_button.dart';

Future<(CharStatus, CharGender)?> showFilterDialog(BuildContext context, CharFilter filter) {
  return showDialog<(CharStatus, CharGender)>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return _FilterBody(
        filter: filter,
      );
    },
  );
}

class _FilterBody extends StatefulWidget {
  const _FilterBody({
    Key? key,
    required this.filter,
  }) : super(key: key);

  final CharFilter filter;

  @override
  State<_FilterBody> createState() => __FilterBodyState();
}

class __FilterBodyState extends State<_FilterBody> {
  late CharFilter filter;

  @override
  void initState() {
    super.initState();
    filter = widget.filter;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SimpleDialog(
      contentPadding: const EdgeInsets.all(16),
      insetPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      children: [
        const _TopRow(),
        AppDropdown<CharStatus>(
          value: filter.status,
          values: CharStatus.values.map((status) => (status, status.text)).toList(),
          onChanged: (status) => filter = filter.copyWith(status: status),
        ),
        AppDropdown<CharGender>(
          value: filter.gender,
          values: CharGender.values.map((gender) => (gender, gender.text)).toList(),
          onChanged: (gender) => filter = filter.copyWith(gender: gender),
        ),
        AppButton(
          text: l10n.apply,
          onPressed: () {
            Navigator.of(context).pop((filter.status, filter.gender));
          },
        )
      ],
    );
  }
}

class _TopRow extends StatelessWidget {
  const _TopRow();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(l10n.filters, style: TextStyles.cardNameStyle),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}
