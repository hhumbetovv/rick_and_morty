import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constants/images.dart';
import '../../../cubits/episodes/episodes_cubit.dart';
import '../../global/components/load_more_button.dart';
import '../../global/components/name_search.dart';
import '../../global/components/page_image.dart';
import 'components/ep_card.dart';

class EpisodesView extends StatelessWidget {
  const EpisodesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          clipBehavior: Clip.none,
          slivers: [
            const SliverToBoxAdapter(child: PageImage(image: AppImages.epsPageImage)),
            SliverToBoxAdapter(
              child: NameSearch(onSearch: (value) {
                context.read<EpisodesCubit>().setFilter(name: value);
              }),
            ),
            BlocConsumer<EpisodesCubit, EpisodesState>(
              listener: (context, state) {
                if (state.failure != null && state.episodes.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.failure!.message ?? l10n.error),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state.isLoading && state.episodes.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (state.failure != null && state.episodes.isEmpty) {
                  return SliverFillRemaining(
                    child: Center(
                      child: Text(state.failure!.message.toString()),
                    ),
                  );
                }
                return SliverList.separated(
                  itemCount: state.nextPage != -1 ? state.episodes.length + 1 : state.episodes.length,
                  itemBuilder: (context, index) {
                    if (state.nextPage != -1 && index == state.episodes.length) {
                      return LoadMoreButton(
                        isLoading: state.isLoading,
                        onPressed: () {
                          context.read<EpisodesCubit>().getEpisodes();
                        },
                      );
                    }
                    return EpCard(
                      id: state.episodes[index].id,
                      name: state.episodes[index].name,
                      air_date: state.episodes[index].air_date,
                      episode: state.episodes[index].episode,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 20);
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
