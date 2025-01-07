part of 'dependency_inject_container.dart';

void _repositories() {
  //
  getItInst.registerLazySingleton<MainRepository>(() => MainRepositoryImpl(
      mainLocalDataSource: getItInst<MainLocalDataSource>(),
      mainRemoteDataSource: getItInst<MainRemoteDataSource>(),
      networkInfo: getItInst<NetworkInfo>()));
}
