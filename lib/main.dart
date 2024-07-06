import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tappyfi/core/network/network_info.dart';
import 'package:tappyfi/core/routes/app_route.dart';
import 'package:tappyfi/core/routes/routes.dart';
import 'package:tappyfi/features/home/data/data_source/character_local_data_source.dart';
import 'package:tappyfi/features/home/data/data_source/character_remote_data_source.dart';
import 'package:tappyfi/features/home/data/reposatory/character_reposatory_impl.dart';
import 'package:tappyfi/features/home/domain/usecases/get_all_character.dart';
import 'package:tappyfi/features/home/presentation/bloc/character_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp(sharedPreferences: sharedPreferences));
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;
  MyApp({
    Key? key,
    required this.sharedPreferences,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => customCharacterBloc()..add(GetAllCharactersEvent()),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoute.rHomeScreen,
        getPages: routes,
        navigatorKey: Get.key,
      ),
    );
  }

  CharacterBloc customCharacterBloc() {
    return CharacterBloc(
      getAllCharacterUseCase: GetAllCharacterUseCase(
        characterReposatory: CharacterReposatoryImpl(
          characterLocalDataSource: CharacterLocalDataSourceImpl(
              sharedPreferences: sharedPreferences),
          characterRemoteDataSource:
              CharacterRemoteDataSourceImpl(client: Client()),
          netWorkInfo: NetWorkInfoImpl(
              internetConnectionChecker: InternetConnectionChecker()),
        ),
      ),
    );
  }
}
