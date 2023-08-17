import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../data/contractors/base_char_repository.dart';
import '../../data/contractors/base_ep_repository.dart';
import '../../data/failures.dart';
import '../../data/models/response/char_model.dart';
import '../../data/models/response/ep_model.dart';
import '../../utils/url_helper.dart';

part 'char_details_state.dart';

class CharDetailsCubit extends Cubit<CharDetailsState> {
  CharDetailsCubit(
    this._charRepository,
    this._epRepository,
  ) : super(const CharDetailsState(episodes: []));

  final BaseCharRepository _charRepository;
  final BaseEpRepository _epRepository;

  void fetchCharacter(int id) async {
    emit(state.copyWith(isLoading: true));
    final Result result = await _charRepository.getCharacter(id);
    if (result.isSuccess()) {
      bool epFailure = false;
      final CharModel model = result.tryGetSuccess()!;
      final List<EpModel> episodes = [];
      for (var element in model.episode) {
        final int id = UrlHelper.getId(element);
        final Result epResult = await _epRepository.getEpisode(id);
        if (epResult.isSuccess()) {
          final EpModel episode = epResult.tryGetSuccess()!;
          episodes.add(episode);
        } else {
          epFailure = true;
        }
      }
      if (epFailure) {
        emit(
          state.copyWith(
            failure: EntityFailure(
              "fetchingFailure".tr(args: ["episodes".tr().toLowerCase()]),
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
            "fetchingFailure".tr(args: ["character".tr().toLowerCase()]),
          ),
        ),
      );
    }
  }
}
