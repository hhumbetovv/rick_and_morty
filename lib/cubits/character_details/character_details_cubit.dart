import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rick_and_morty/data/contractors/base_episode_repository.dart';
import 'package:rick_and_morty/data/models/response/episode_model.dart';
import 'package:rick_and_morty/utils/url_helper.dart';

import '../../data/contractors/base_character_repository.dart';
import '../../data/failures.dart';
import '../../data/models/response/character_model.dart';

part 'character_details_state.dart';

class CharacterDetailsCubit extends Cubit<CharacterDetailsState> {
  CharacterDetailsCubit(
    this._characterRepository,
    this._episodeRepository,
  ) : super(const CharacterDetailsState(episodes: []));

  final BaseCharacterRepository _characterRepository;
  final BaseEpisodeRepository _episodeRepository;

  void fetchCharacter(int id) async {
    emit(state.copyWith(isLoading: true));
    final Result result = await _characterRepository.getCharacter(id);
    if (result.isSuccess()) {
      bool epFailure = false;
      final CharacterModel model = result.tryGetSuccess()!;
      final List<EpisodeModel> episodes = [];
      for (var element in model.episode) {
        final int id = UrlHelper.getId(element);
        final Result epResult = await _episodeRepository.getEpisode(id);
        if (epResult.isSuccess()) {
          final EpisodeModel episode = epResult.tryGetSuccess()!;
          episodes.add(episode);
        } else {
          epFailure = true;
        }
      }
      if (epFailure) {
        emit(
          state.copyWith(
            failure: EntityFailure(
              'Some error occured while fetching episodes\n'
              'Please check your internet connection',
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(
            model: model,
            episodes: episodes,
          ),
        );
      }
    } else {
      emit(
        state.copyWith(
          failure: EntityFailure(
            'Some error occured while fetching character\n'
            'Please check your internet connection',
          ),
        ),
      );
    }
  }
}
