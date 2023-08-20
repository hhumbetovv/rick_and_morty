import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/contractors/base_char_repository.dart';
import '../../data/failures.dart';
import '../../data/models/filters/char_filter.dart';
import '../../data/models/response/char_model.dart';
import '../../data/models/response/result_model.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit(
    this._charRepository,
  ) : super(const CharactersState(characters: [], nextPage: 1, filter: CharFilter()));

  final BaseCharRepository _charRepository;

  void getCharacters() async {
    emit(state.copyWith(isLoading: true));
    final response = await _charRepository.getCharacters(
      page: state.nextPage,
      name: state.filter.name,
      status: state.filter.status.value,
      gender: state.filter.gender.value,
    );
    if (response.isSuccess()) {
      final ResultModel result = response.tryGetSuccess()!;
      final List<CharModel> characters = result.results.map((entityJson) {
        return CharModel.fromJson(entityJson);
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
              // "fetchingFailureWithFilter".tr(args: ["characters".tr().toLowerCase()]),
              ),
        ),
      );
    }
  }

  void setFilter({
    String? name,
    CharStatus? status,
    CharGender? gender,
  }) {
    final CharFilter filter = CharFilter(
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
