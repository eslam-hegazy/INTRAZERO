import 'dart:convert';

import 'package:tappyfi/core/error/exception.dart';
import 'package:tappyfi/features/home/data/models/character_model.dart';
import 'package:http/http.dart' as http;

abstract class CharacterRemoteDataSource{
  Future<List<CharacterModel>>getAllCharacters();
}
class CharacterRemoteDataSourceImpl extends CharacterRemoteDataSource{
    final http.Client client;

  CharacterRemoteDataSourceImpl({required this.client});
  final String baseUrl = 'https://swapi.dev/api';
  @override
  Future<List<CharacterModel>> getAllCharacters() async {
    final http.Response response = await http.get(
      Uri.parse("$baseUrl/people/"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);

      // Extract count from the JSON response
      int count = jsonResponse['count'];
      print('Count from API: $count');

      // Extract results (character list) from the JSON response
      final List<dynamic> results = jsonResponse['results'];
      List<CharacterModel> characterModels = results
          .map<CharacterModel>((json) => CharacterModel.fromJson(json))
          .toList();
      print("eslam ${characterModels.length}");
      return characterModels;
    } else {
      throw Exception('Failed to load characters');
    }
  }
}