import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rick_and_morty/data/contractors/base_episode_repository.dart';
import 'package:rick_and_morty/data/models/response/episode_model.dart';
import 'package:rick_and_morty/utils/url_helper.dart';

import '../../data/contractors/base_character_repository.dart';
import '../../data/failures.dart';
import '../../data/models/response/character_model.dart';

part 'episode_details_state.dart';

class EpisodeDetailsCubit extends Cubit<EpisodeDetailsState> {
  EpisodeDetailsCubit(
    this._episodeRepository,
    this._characterRepository,
  ) : super(const EpisodeDetailsState(cast: []));

  final BaseEpisodeRepository _episodeRepository;
  final BaseCharacterRepository _characterRepository;

  void fetchEpisode(int id) async {
    emit(state.copyWith(isLoading: true));
    final Result result = await _episodeRepository.getEpisode(id);
    if (result.isSuccess()) {
      bool charFailure = false;
      final EpisodeModel model = result.tryGetSuccess()!;
      final List<CharacterModel> cast = [];
      for (var element in model.characters) {
        final int id = UrlHelper.getId(element);
        final Result charResult = await _characterRepository.getCharacter(id);
        if (charResult.isSuccess()) {
          final CharacterModel character = charResult.tryGetSuccess()!;
          cast.add(character);
        } else {
          charFailure = true;
        }
      }
      if (charFailure) {
        emit(
          state.copyWith(
            failure: EntityFailure(
              'Some error occured while fetching cast\n'
              'Please check your internet connection',
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(
            model: model,
            cast: cast,
          ),
        );
      }
    } else {
      emit(
        state.copyWith(
          failure: EntityFailure(
            'Some error occured while fetching episode\n'
            'Please check your internet connection',
          ),
        ),
      );
    }
  }
}
