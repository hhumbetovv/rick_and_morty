import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/images.dart';
import '../../../cubits/characters/characters_cubit.dart';
import '../../../data/models/filters/character_filter.dart';
import '../../dialogs/filter_dialog.dart';
import '../../global/components/app_button.dart';
import '../../global/components/char_card.dart';
import '../../global/components/load_more_button.dart';
import '../../global/components/name_search.dart';
import '../../global/components/page_image.dart';

class CharactersView extends StatelessWidget {
  const CharactersView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          clipBehavior: Clip.none,
          slivers: [
            const SliverToBoxAdapter(child: PageImage(image: AppImages.charsPageImage)),
            SliverToBoxAdapter(
              child: NameSearch(onSearch: (value) {
                context.read<CharactersCubit>().setFilter(name: value);
              }),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: AppButton(
                  text: "advancedFilters".tr(),
                  onPressed: () async {
                    final result = await showFilterDialog(context, context.read<CharactersCubit>().state.filter);
                    if (result != null && context.mounted) {
                      final (CharacterStatus status, CharacterGender gender) = result;
                      context.read<CharactersCubit>().setFilter(status: status, gender: gender);
                    }
                  },
                ),
              ),
            ),
            BlocConsumer<CharactersCubit, CharactersState>(
              listener: (context, state) {
                if (state.failure != null && state.characters.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.failure?.message ?? "error".tr()),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state.isLoading && state.characters.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (state.failure != null && state.characters.isEmpty) {
                  return SliverFillRemaining(
                    child: Center(
                      child: Text(state.failure!.message.toString()),
                    ),
                  );
                }
                return SliverList.separated(
                  itemCount: state.nextPage != -1 ? state.characters.length + 1 : state.characters.length,
                  itemBuilder: (context, index) {
                    if (state.nextPage != -1 && index == state.characters.length) {
                      return LoadMoreButton(
                        isLoading: state.isLoading,
                        onPressed: () {
                          context.read<CharactersCubit>().getCharacters();
                        },
                      );
                    }
                    return CharCard(
                      id: state.characters[index].id,
                      name: state.characters[index].name,
                      species: state.characters[index].species,
                      image: state.characters[index].image,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 20);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
