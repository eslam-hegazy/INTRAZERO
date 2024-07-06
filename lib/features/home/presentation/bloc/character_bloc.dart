import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tappyfi/core/strings/faliure_strings.dart';
import 'package:tappyfi/features/home/domain/entities/character.dart';
import 'package:tappyfi/features/home/domain/usecases/get_all_character.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetAllCharacterUseCase getAllCharacterUseCase;
  CharacterBloc({required this.getAllCharacterUseCase})
      : super(CharacterInitial()) {
    on<CharacterEvent>((event, emit) async {
      if (event is GetAllCharactersEvent || event is RefreshCharacterEvent) {
        emit(LoadingCharacterState());
        final characters = await getAllCharacterUseCase.call();
        characters.fold(
          (l) {
            emit(ErrorCharacterState(message: failureToMessage(l)));
          },
          (r) {
            emit(SuccessCharacterState(characters: r));
          },
        );
      }
    });
  }
}
