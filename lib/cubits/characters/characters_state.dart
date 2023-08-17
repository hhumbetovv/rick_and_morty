part of 'characters_cubit.dart';

class CharactersState extends Equatable {
  final List<CharModel> characters;
  final int nextPage;
  final bool isLoading;
  final EntityFailure? failure;
  final CharFilter filter;

  const CharactersState({
    required this.characters,
    required this.nextPage,
    this.failure,
    this.isLoading = false,
    required this.filter,
  });

  @override
  List<Object?> get props => [characters, isLoading, failure, nextPage, filter];

  CharactersState copyWith({
    List<CharModel>? characters,
    int? nextPage,
    EntityFailure? failure,
    bool isLoading = false,
    CharFilter? filter,
  }) {
    return CharactersState(
      characters: characters ?? this.characters,
      nextPage: nextPage ?? this.nextPage,
      isLoading: isLoading,
      failure: failure,
      filter: filter ?? this.filter,
    );
  }
}
