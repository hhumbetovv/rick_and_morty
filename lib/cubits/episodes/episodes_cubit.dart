import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/contractors/base_episode_repository.dart';
import '../../data/failures.dart';
import '../../data/models/filters/episode_filter.dart';
import '../../data/models/response/episode_model.dart';
import '../../data/models/response/result_model.dart';

part 'episodes_state.dart';

class EpisodesCubit extends Cubit<EpisodesState> {
  EpisodesCubit(this.episodeRepository)
      : super(const EpisodesState(episodes: [], nextPage: 1, filter: EpisodeFilter()));

  final BaseEpisodeRepository episodeRepository;

  void getEpisodes() async {
    emit(state.copyWith(isLoading: true));
    final response = await episodeRepository.getEpisodes(
      page: state.nextPage,
      name: state.filter.name,
    );
    if (response.isSuccess()) {
      final ResultModel result = response.tryGetSuccess()!;
      final List<EpisodeModel> episodes = result.results.map((entityJson) {
        return EpisodeModel.fromJson(entityJson);
      }).toList();
      final int nextPage = result.info.next == null ? -1 : state.nextPage + 1;
      emit(
        state.copyWith(
          episodes: [...state.episodes, ...episodes],
          nextPage: nextPage,
        ),
      );
    } else {
      final result = response.tryGetError()!;
      debugPrint(result.message);
      emit(
        state.copyWith(
          failure: EntityFailure(
            'Some Error occured while fetching episodes\n'
            'Please check your internet connection or use different filter options',
          ),
        ),
      );
    }
  }

  void setFilter({String? name}) {
    final EpisodeFilter filter = EpisodeFilter(
      name: name ?? state.filter.name,
    );
    if (filter != state.filter) {
      emit(state.copyWith(episodes: [], nextPage: 1, filter: filter));
      getEpisodes();
    }
  }
}
