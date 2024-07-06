import 'package:tappyfi/features/home/data/models/character_model.dart';

abstract class CharacterRemoteDataSource{
  Future<List<CharacterModel>>getAllCharacters();
}
class PostRemoteDataSourceImpl extends CharacterRemoteDataSource{
  @override
  Future<List<CharacterModel>> getAllCharacters() {
    // TODO: implement getAllCharacters
    throw UnimplementedError();
  }
}