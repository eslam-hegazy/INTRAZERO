part of 'character_bloc.dart';

sealed class CharacterState extends Equatable {
  const CharacterState();
  
  @override
  List<Object> get props => [];
}

final class CharacterInitial extends CharacterState {}

class LoadingCharacterState extends CharacterState{}
class SuccessCharacterState extends CharacterState{
  final List<Character>characters;

  const SuccessCharacterState({required this.characters});
}
class ErrorCharacterState extends CharacterState{
  final String message;

  const   ErrorCharacterState({required this.message});
}
