import 'package:flutter/material.dart';
import 'package:rick_and_morty/constants/text_styles.dart';
import 'package:rick_and_morty/data/models/response/character_model.dart';
import 'package:rick_and_morty/presentation/global/components/char_card.dart';

class CharList extends StatelessWidget {
  const CharList({
    Key? key,
    required this.title,
    required this.list,
  }) : super(key: key);

  final String title;
  final List<CharacterModel> list;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyles.containerTitleStyle),
          const SizedBox(height: 16),
          ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return CharCard(
                id: list[index].id,
                name: list[index].name,
                species: list[index].species,
                image: list[index].image,
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 24);
            },
          )
        ],
      ),
    );
  }
}
