import 'package:flutter/material.dart';
import 'package:rick_and_morty/constants/text_manager.dart';
import 'package:rick_and_morty/constants/text_styles.dart';
import 'package:rick_and_morty/data/models/response/location_model.dart';
import 'package:rick_and_morty/presentation/global/components/info_list_tile.dart';

class LocInfo extends StatelessWidget {
  const LocInfo({
    Key? key,
    required this.model,
  }) : super(key: key);

  final LocationModel? model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(TextManager.informations, style: TextStyles.containerTitleStyle),
          const SizedBox(height: 16),
          InfoListTile(title: TextManager.type, value: model?.type ?? ''),
          InfoListTile(title: TextManager.dimension, value: model?.dimension ?? ''),
        ],
      ),
    );
  }
}
