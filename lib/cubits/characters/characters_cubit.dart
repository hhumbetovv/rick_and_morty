import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/contractors/base_character_repository.dart';
import '../../data/failures.dart';
import '../../data/models/filters/character_filter.dart';
import '../../data/models/response/character_model.dart';
import '../../data/models/response/result_model.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit(this._characterRepository)
      : super(const CharactersState(characters: [], nextPage: 1, filter: CharacterFilter()));

  final BaseCharacterRepository _characterRepository;

  void getCharacters() async {
    emit(state.copyWith(isLoading: true));
    final response = await _characterRepository.getCharacters(
      page: state.nextPage,
      name: state.filter.name,
      status: state.filter.status.value,
      gender: state.filter.gender.value,
    );
    if (response.isSuccess()) {
      final ResultModel result = response.tryGetSuccess()!;
      final List<CharacterModel> characters = result.results.map((entityJson) {
        return CharacterModel.fromJson(entityJson);
      }).toList();
      final int nextPage = result.info.next == null ? -1 : state.nextPage + 1;
      emit(
        state.copyWith(
          characters: [...state.characters, ...characters],
          nextPage: nextPage,
        ),
      );
    } else {
      emit(
        state.copyWith(
          failure: EntityFailure(
            'Some error occured while fetching characters\n'
            'Please check your internet connection or use different filter options',
          ),
        ),
      );
    }
  }

  void setFilter({
    String? name,
    CharacterStatus? status,
    CharacterGender? gender,
  }) {
    final CharacterFilter filter = CharacterFilter(
      name: name ?? state.filter.name,
      status: status ?? state.filter.status,
      gender: gender ?? state.filter.gender,
    );
    if (filter != state.filter) {
      emit(state.copyWith(characters: [], nextPage: 1, filter: filter));
      getCharacters();
    }
  }
}
