import 'package:dartz/dartz.dart';
import 'package:tappyfi/core/error/exception.dart';
import 'package:tappyfi/core/error/failure.dart';
import 'package:tappyfi/core/network/network_info.dart';
import 'package:tappyfi/features/home/data/data_source/character_local_data_source.dart';
import 'package:tappyfi/features/home/data/data_source/character_remote_data_source.dart';
import 'package:tappyfi/features/home/domain/entities/character.dart';
import 'package:tappyfi/features/home/domain/reposatory/character_reposatory.dart';

class CharacterReposatoryImpl extends CharacterReposatory {
  final CharacterLocalDataSource characterLocalDataSource;
  final CharacterRemoteDataSource characterRemoteDataSource;
  final NetWorkInfoImpl netWorkInfo;

  CharacterReposatoryImpl({
    required this.characterLocalDataSource,
    required this.characterRemoteDataSource,
    required this.netWorkInfo,
  });
  @override
  Future<Either<Failure, List<Character>>> getAllCharacters() async {
    if (await netWorkInfo.isConnected) {
      try {
        final remoteData = await characterRemoteDataSource.getAllCharacters();
        characterLocalDataSource.chacheCharacters(remoteData);
        return Right(remoteData);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localeData = await characterLocalDataSource.getCacheCharacters();
        return Right(localeData);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
    // TODO: implement getAllCharacters
    throw UnimplementedError();
  }
}
