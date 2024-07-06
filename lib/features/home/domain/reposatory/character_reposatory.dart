import 'package:dartz/dartz.dart';
import 'package:tappyfi/core/error/failure.dart';
import 'package:tappyfi/features/home/domain/entities/character.dart';

abstract class CharacterReposatory{
  Future<Either<Failure,List<Character>>>getAllCharacters();
}