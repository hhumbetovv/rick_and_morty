import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../data/contractors/base_character_repository.dart';
import '../../data/contractors/base_location_repository.dart';
import '../../data/failures.dart';
import '../../data/models/response/character_model.dart';
import '../../data/models/response/location_model.dart';
import '../../utils/url_helper.dart';

part 'location_details_state.dart';

class LocationDetailsCubit extends Cubit<LocationDetailsState> {
  LocationDetailsCubit(
    this._locationRepository,
    this._characterRepository,
  ) : super(const LocationDetailsState(residents: []));

  final BaseLocationRepository _locationRepository;
  final BaseCharacterRepository _characterRepository;

  void fetchLocation(int id) async {
    emit(state.copyWith(isLoading: true));
    final Result result = await _locationRepository.getLocation(id);
    if (result.isSuccess()) {
      bool charFailure = false;
      final LocationModel model = result.tryGetSuccess()!;
      final List<CharacterModel> residents = [];
      for (var element in model.residents) {
        final int id = UrlHelper.getId(element);
        final Result charResult = await _characterRepository.getCharacter(id);
        if (charResult.isSuccess()) {
          final CharacterModel character = charResult.tryGetSuccess()!;
          residents.add(character);
        } else {
          charFailure = true;
        }
      }
      if (charFailure) {
        emit(
          state.copyWith(
            failure: EntityFailure(
              'Some error occured while fetching residents\n'
              'Please check your internet connection',
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
            'Some error occured while fetching location\n'
            'Please check your internet connection',
          ),
        ),
      );
    }
  }
}
