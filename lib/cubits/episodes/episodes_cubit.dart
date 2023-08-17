import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/contractors/base_ep_repository.dart';
import '../../data/failures.dart';
import '../../data/models/filters/ep_filter.dart';
import '../../data/models/response/ep_model.dart';
import '../../data/models/response/result_model.dart';

part 'episodes_state.dart';

class EpisodesCubit extends Cubit<EpisodesState> {
  EpisodesCubit(
    this._epRepository,
  ) : super(const EpisodesState(episodes: [], nextPage: 1, filter: EpisodeFilter()));

  final BaseEpRepository _epRepository;

  void getEpisodes() async {
    emit(state.copyWith(isLoading: true));
    final response = await _epRepository.getEpisodes(
      page: state.nextPage,
      name: state.filter.name,
    );
    if (response.isSuccess()) {
      final ResultModel result = response.tryGetSuccess()!;
      final List<EpModel> episodes = result.results.map((entityJson) {
        return EpModel.fromJson(entityJson);
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
            "fetchingFailureWithFilter".tr(args: ["episodes".tr().toLowerCase()]),
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
