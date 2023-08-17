part of 'char_details_cubit.dart';

class CharDetailsState extends Equatable {
  final CharModel? model;
  final bool isLoading;
  final List<EpModel> episodes;
  final EntityFailure? failure;

  const CharDetailsState({
    this.model,
    this.isLoading = false,
    this.failure,
    required this.episodes,
  });

  @override
  List<Object?> get props => [model, isLoading, failure, episodes];

  CharDetailsState copyWith({
    CharModel? model,
    bool isLoading = false,
    EntityFailure? failure,
    List<EpModel>? episodes,
  }) {
    return CharDetailsState(
      model: model,
      isLoading: isLoading,
      failure: failure,
      episodes: episodes ?? this.episodes,
    );
  }
}
