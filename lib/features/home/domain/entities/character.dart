import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final String name;
  final String height;
  final String mass;
  final String hairColor;
  final String skinColor;
  final String eyeColor;
  final String birthYear;
  final String gender;

  const Character({
    required this.name,
    required this.height,
    required this.mass,
    required this.hairColor,
    required this.skinColor,
    required this.eyeColor,
    required this.birthYear,
    required this.gender,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [name,height,mass,hairColor,skinColor,eyeColor,birthYear,gender];
}
