part of 'character_bloc.dart';

sealed class CharacterEvent extends Equatable {
  const CharacterEvent();

  @override
  List<Object> get props => [];
}
class GetAllCharactersEvent extends CharacterEvent{}
class RefreshCharacterEvent extends CharacterEvent{}