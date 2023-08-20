import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../data/contractors/base_char_repository.dart';
import '../../data/contractors/base_ep_repository.dart';
import '../../data/failures.dart';
import '../../data/models/response/char_model.dart';
import '../../data/models/response/ep_model.dart';
import '../../utils/url_helper.dart';

part 'ep_details_state.dart';

class EpDetailsCubit extends Cubit<EpDetailsState> {
  EpDetailsCubit(
    this._epRepository,
    this._charRepository,
  ) : super(const EpDetailsState(cast: []));

  final BaseEpRepository _epRepository;
  final BaseCharRepository _charRepository;

  void fetchEpisode(int id) async {
    emit(state.copyWith(isLoading: true));
    final Result result = await _epRepository.getEpisode(id);
    if (result.isSuccess()) {
      bool charFailure = false;
      final EpModel model = result.tryGetSuccess()!;
      final List<CharModel> cast = [];
      for (var element in model.characters) {
        final int id = UrlHelper.getId(element);
        final Result charResult = await _charRepository.getCharacter(id);
        if (charResult.isSuccess()) {
          final CharModel character = charResult.tryGetSuccess()!;
          cast.add(character);
        } else {
          charFailure = true;
        }
      }
      if (charFailure) {
        emit(
          state.copyWith(
            failure: EntityFailure(
                // "fetchingFailure".tr(args: ["cast".tr().toLowerCase()]),
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
              // "fetchingFailure".tr(args: ["episode".tr().toLowerCase()]),
              ),
        ),
      );
    }
  }
}
