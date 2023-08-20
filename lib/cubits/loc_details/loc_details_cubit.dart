import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../data/contractors/base_char_repository.dart';
import '../../data/contractors/base_loc_repository.dart';
import '../../data/failures.dart';
import '../../data/models/response/char_model.dart';
import '../../data/models/response/loc_model.dart';
import '../../utils/url_helper.dart';

part 'loc_details_state.dart';

class LocDetailsCubit extends Cubit<LocDetailsState> {
  LocDetailsCubit(
    this._locRepository,
    this._charRepository,
  ) : super(const LocDetailsState(residents: []));

  final BaseLocRepository _locRepository;
  final BaseCharRepository _charRepository;

  void fetchLocation(int id) async {
    emit(state.copyWith(isLoading: true));
    final Result result = await _locRepository.getLocation(id);
    if (result.isSuccess()) {
      bool charFailure = false;
      final LocModel model = result.tryGetSuccess()!;
      final List<CharModel> residents = [];
      for (var element in model.residents) {
        final int id = UrlHelper.getId(element);
        final Result charResult = await _charRepository.getCharacter(id);
        if (charResult.isSuccess()) {
          final CharModel character = charResult.tryGetSuccess()!;
          residents.add(character);
        } else {
          charFailure = true;
        }
      }
      if (charFailure) {
        emit(
          state.copyWith(
            failure: EntityFailure(
                // "fetchingFailure".tr(args: ["residents".tr().toLowerCase()]),
                ),
          ),
        );
      } else {
        emit(
          state.copyWith(
            model: model,
            residents: residents,
          ),
        );
      }
    } else {
      emit(
        state.copyWith(
          failure: EntityFailure(
              // "fetchingFailure".tr(args: ["location".tr().toLowerCase()]),
              ),
        ),
      );
    }
  }
}
