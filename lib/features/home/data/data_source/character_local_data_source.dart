import 'package:dartz/dartz.dart';
import 'package:tappyfi/features/home/data/models/character_model.dart';

abstract class CharacterLocalDataSource{
  Future<List<CharacterModel>>getCacheCharacters();
  Future<Unit>chacheCharacters(List<CharacterModel>characterData);
}
class CharacterLocalDataSourceImpl extends CharacterLocalDataSource{
  @override
  Future<Unit> chacheCharacters(List<CharacterModel> characterData) {
    // TODO: implement chacheCharacters
    throw UnimplementedError();
  }

  @override
  Future<List<CharacterModel>> getCacheCharacters() {
    // TODO: implement getCacheCharacters
    throw UnimplementedError();
  }
}