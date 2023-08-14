import 'package:flutter/material.dart';
import 'package:rick_and_morty/constants/text_manager.dart';
import 'package:rick_and_morty/constants/text_styles.dart';
import 'package:rick_and_morty/data/models/filters/character_filter.dart';
import 'package:rick_and_morty/presentation/global/components/app_button.dart';
import 'package:rick_and_morty/presentation/global/components/app_dropdown_button.dart';

Future<(CharacterStatus, CharacterGender)?> showFilterDialog(BuildContext context, CharacterFilter filter) {
  return showDialog<(CharacterStatus, CharacterGender)>(
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

  final CharacterFilter filter;

  @override
  State<_FilterBody> createState() => __FilterBodyState();
}

class __FilterBodyState extends State<_FilterBody> {
  late CharacterFilter filter;

  @override
  void initState() {
    super.initState();
    filter = widget.filter;
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.all(16),
      insetPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      children: [
        const _TopRow(),
        AppDropdown<CharacterStatus>(
          value: filter.status,
          values: CharacterStatus.values.map((status) => (status, status.text)).toList(),
          onChanged: (status) => filter = filter.copyWith(status: status),
        ),
        AppDropdown<CharacterGender>(
          value: filter.gender,
          values: CharacterGender.values.map((gender) => (gender, gender.text)).toList(),
          onChanged: (gender) => filter = filter.copyWith(gender: gender),
        ),
        AppButton(
          text: TextManager.apply,
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(TextManager.filters, style: TextStyles.cardNameStyle),
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
