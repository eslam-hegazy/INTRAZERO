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

  // Factory constructor to create an instance from a JSON map
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

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'height': height,
      'mass': mass,
      'hair_color': hairColor,
      'skin_color': skinColor,
      'eye_color': eyeColor,
      'birth_year': birthYear,
      'gender': gender,
    };
  }
}
