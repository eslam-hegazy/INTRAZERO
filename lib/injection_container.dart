import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tappyfi/core/network/network_info.dart';
import 'package:tappyfi/features/home/data/data_source/character_local_data_source.dart';
import 'package:tappyfi/features/home/data/data_source/character_remote_data_source.dart';
import 'package:tappyfi/features/home/data/reposatory/character_reposatory_impl.dart';
import 'package:tappyfi/features/home/domain/reposatory/character_reposatory.dart';
import 'package:tappyfi/features/home/domain/usecases/get_all_character.dart';
import 'package:tappyfi/features/home/presentation/bloc/character_bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  // External
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  // Features

  // Bloc
  sl.registerFactory(() => CharacterBloc(getAllCharacterUseCase: sl()));

  // UseCases
  sl.registerLazySingleton(
      () => GetAllCharacterUseCase(characterReposatory: sl()));

  // Reposatory
  sl.registerLazySingleton<CharacterReposatory>(
    () => CharacterReposatoryImpl(
      characterLocalDataSource: sl(),
      characterRemoteDataSource: sl(),
      netWorkInfo: sl(),
    ),
  );

  // DataSources
  sl.registerLazySingleton<CharacterLocalDataSource>(
      () => CharacterLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<CharacterRemoteDataSource>(
      () => CharacterRemoteDataSourceImpl(client: sl()));

  // Core
  sl.registerLazySingleton<BaseNetWorkInfo>(
      () => NetWorkInfoImpl(internetConnectionChecker: sl()));
}
