import 'package:tappyfi/features/home/domain/entities/character.dart';

class CharacterModel extends Character {
  const CharacterModel({
    required super.name,
    required super.height,
    required super.mass,
    required super.hairColor,
    required super.skinColor,
    required super.eyeColor,
    required super.birthYear,
    required super.gender,
  });
   factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      name: json['name'],
      height: json['height'],
      mass: json['mass'],
      hairColor: json['hair_color'],
      skinColor: json['skin_color'],
      eyeColor: json['eye_color'],
      birthYear: json['birth_year'],
      gender: json['gender'],
    );
  }
}
