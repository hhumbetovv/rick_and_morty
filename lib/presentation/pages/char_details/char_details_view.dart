import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../../cubits/char_details/char_details_cubit.dart';
import '../../global/components/entity_name.dart';
import '../../global/components/go_back_button.dart';
import '../../global/skeletons/entity_name_skeleton.dart';
import '../../global/skeletons/info_skeleton.dart';
import 'components/avatar.dart';
import 'components/avatar_skeleton.dart';
import 'components/char_episodes.dart';
import 'components/char_info.dart';

class CharDetailsView extends StatefulWidget {
  const CharDetailsView({
    Key? key,
  }) : super(key: key);

  @override
  State<CharDetailsView> createState() => _CharDetailsViewState();
}

class _CharDetailsViewState extends State<CharDetailsView> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          clipBehavior: Clip.none,
          child: BlocConsumer<CharDetailsCubit, CharDetailsState>(
            listener: (context, state) {
              if (state.failure != null) {
                context.pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.failure?.message ?? l10n.error),
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
