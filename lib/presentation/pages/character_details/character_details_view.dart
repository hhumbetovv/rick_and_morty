import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/constants/text_manager.dart';
import 'package:rick_and_morty/cubits/character_details/character_details_cubit.dart';
import 'package:rick_and_morty/presentation/global/components/entity_name.dart';
import 'package:rick_and_morty/presentation/global/components/go_back_button.dart';
import 'package:rick_and_morty/presentation/global/skeletons/entity_name_skeleton.dart';
import 'package:rick_and_morty/presentation/global/skeletons/info_skeleton.dart';
import 'package:rick_and_morty/presentation/pages/character_details/components/avatar.dart';
import 'package:rick_and_morty/presentation/pages/character_details/components/avatar_skeleton.dart';
import 'package:rick_and_morty/presentation/pages/character_details/components/char_episodes.dart';
import 'package:rick_and_morty/presentation/pages/character_details/components/char_info.dart';

class CharacterDetailsView extends StatelessWidget {
  const CharacterDetailsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          clipBehavior: Clip.none,
          child: BlocConsumer<CharacterDetailsCubit, CharacterDetailsState>(
            listener: (context, state) {
              if (state.failure != null) {
                context.pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.failure?.message ?? TextManager.error),
                  ),
                );
              }
            },
            builder: (context, state) {
              return AnimatedCrossFade(
                duration: const Duration(milliseconds: 500),
                firstChild: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GoBackButton(),
                    AvatarSkeleton(),
                    EntityNameSkeleton(),
                    InfoSkeleton(count: 6),
                    InfoSkeleton(isTriple: true),
                  ],
                ),
                secondChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const GoBackButton(),
                    Avatar(image: state.model?.image),
                    EntityName(name: state.model?.name ?? ''),
                    CharInfo(model: state.model),
                    CharEpisodes(episodes: state.episodes),
                  ],
                ),
                crossFadeState: state.isLoading ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              );
            },
          ),
        ),
      ),
    );
  }
}
