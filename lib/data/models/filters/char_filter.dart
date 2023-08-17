import 'package:equatable/equatable.dart';

class CharFilter extends Equatable {
  final String name;
  final CharStatus status;
  final CharGender gender;

  const CharFilter({
    this.name = '',
    this.status = CharStatus.nostatus,
    this.gender = CharGender.nogender,
  });

  @override
  List<Object?> get props => [name, status, gender];

  CharFilter copyWith({
    String? name,
    CharStatus? status,
    CharGender? gender,
  }) {
    return CharFilter(
      name: name ?? this.name,
      status: status ?? this.status,
      gender: gender ?? this.gender,
    );
  }
}

enum CharStatus {
  nostatus('', "No Status Selection"),
  alive('alive', "Alive"),
  dead('dead', "Dead"),
  unknown('unknown', "unknown");

  const CharStatus(this.value, this.text);

  final String value;
  final String text;
}

enum CharGender {
  nogender('', "No Gender Selection"),
  female('female', "Female"),
  male('male', "Male"),
  genderless('genderless', "Genderless"),
  unknown('unknown', "unknown");

  const CharGender(this.value, this.text);

  final String value;
  final String text;
}
