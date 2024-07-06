import 'package:dartz/dartz.dart';
import 'package:tappyfi/core/error/failure.dart';
import 'package:tappyfi/features/home/domain/entities/character.dart';

import '../reposatory/character_reposatory.dart';

class GetAllCharacterUseCase{
  final CharacterReposatory characterReposatory;

  GetAllCharacterUseCase({required this.characterReposatory});
  Future<Either<Failure, List<Character>>>call()async{
    return await characterReposatory.getAllCharacters();
  }
}