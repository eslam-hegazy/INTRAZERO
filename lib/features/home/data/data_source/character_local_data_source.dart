import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tappyfi/core/error/exception.dart';
import 'package:tappyfi/core/utils/app_constants.dart';
import 'package:tappyfi/features/home/data/models/character_model.dart';

abstract class CharacterLocalDataSource{
  Future<List<CharacterModel>>getCacheCharacters();
  Future<Unit>chacheCharacters(List<CharacterModel>characterData);
}
class CharacterLocalDataSourceImpl extends CharacterLocalDataSource{
  final SharedPreferences sharedPreferences;

  CharacterLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> chacheCharacters(List<CharacterModel> characterData) {
    List characterModelsToJson=characterData.map<Map<String,dynamic>>((characterModel)=>characterModel.toJson()).toList();
    sharedPreferences.setString(AppConstants.CACHE_CHARACTERS, json.encode(characterModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<List<CharacterModel>> getCacheCharacters() {
    final jsonString=sharedPreferences.getString(AppConstants.CACHE_CHARACTERS);
    if(jsonString !=null){
      List decodeJsonData=json.decode(jsonString);
      List<CharacterModel>jsonToCharacterModel=decodeJsonData.map<CharacterModel>((e)=>CharacterModel.fromJson(e)).toList();
      return Future.value(jsonToCharacterModel);
    }else{
      throw EmptyCacheException();
    }
  }
}