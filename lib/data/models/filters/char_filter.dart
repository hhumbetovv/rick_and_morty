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
  nostatus('', "noStatus"),
  alive('alive', "alive"),
  dead('dead', "dead"),
  unknown('unknown', "unknown");

  const CharStatus(this.value, this.text);

  final String value;
  final String text;
}

enum CharGender {
  nogender('', "noGender"),
  female('female', "female"),
  male('male', "male"),
  genderless('genderless', "genderless"),
  unknown('unknown', "unknown");

  const CharGender(this.value, this.text);

  final String value;
  final String text;
}
