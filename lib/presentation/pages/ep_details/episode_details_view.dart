import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../../cubits/ep_details/ep_details_cubit.dart';
import '../../global/components/char_list.dart';
import '../../global/components/entity_name.dart';
import '../../global/components/go_back_button.dart';
import '../../global/skeletons/char_list_skeleton.dart';
import '../../global/skeletons/entity_name_skeleton.dart';
import '../../global/skeletons/info_skeleton.dart';
import 'components/ep_info.dart';

class EpisodeDetailsView extends StatelessWidget {
  const EpisodeDetailsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        clipBehavior: Clip.none,
        child: BlocConsumer<EpDetailsCubit, EpDetailsState>(
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
              firstChild: const Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GoBackButton(),
                    EntityNameSkeleton.padding(),
                    InfoSkeleton(count: 2),
                    CharListSkeleton(),
                  ],
                ),
              ),
              secondChild: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const GoBackButton(),
                    EntityName.padding(name: state.model?.name ?? ''),
                    EpInfo(model: state.model),
                    CharList(title: l10n.cast, list: state.cast),
                  ],
                ),
              ),
              crossFadeState: state.isLoading ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            );
          },
        ),
      ),
    );
  }
}
