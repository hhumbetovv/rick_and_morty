import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../cubits/character_details/character_details_cubit.dart';
import '../../global/components/entity_name.dart';
import '../../global/components/go_back_button.dart';
import '../../global/skeletons/entity_name_skeleton.dart';
import '../../global/skeletons/info_skeleton.dart';
import 'components/avatar.dart';
import 'components/avatar_skeleton.dart';
import 'components/char_episodes.dart';
import 'components/char_info.dart';

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
                    content: Text(state.failure?.message ?? "error".tr()),
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
