part of 'ep_details_cubit.dart';

class EpDetailsState extends Equatable {
  final EpModel? model;
  final bool isLoading;
  final List<CharModel> cast;
  final EntityFailure? failure;

  const EpDetailsState({
    this.model,
    this.isLoading = false,
    this.failure,
    required this.cast,
  });

  @override
  List<Object?> get props => [model, isLoading, failure, cast];

  EpDetailsState copyWith({
    EpModel? model,
    bool isLoading = false,
    EntityFailure? failure,
    List<CharModel>? cast,
  }) {
    return EpDetailsState(
      model: model,
      isLoading: isLoading,
      failure: failure,
      cast: cast ?? this.cast,
    );
  }
}
