import 'package:equatable/equatable.dart';

class LocationFilter extends Equatable {
  final String name;

  const LocationFilter({
    this.name = '',
  });

  @override
  List<Object?> get props => [name];

  LocationFilter copyWith({
    String? name,
  }) {
    return LocationFilter(
      name: name ?? this.name,
    );
  }
}
