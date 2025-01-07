part of 'dependency_inject_container.dart';

void _dataSources() {
  getItInst.registerLazySingleton<MainRemoteDataSource>(
      () => MainRemoteDataSourceImpl(getItInst<DioClient>()));
  getItInst.registerLazySingleton<MainLocalDataSource>(
      () => MainLocalDataSourceImpl(getItInst<SharedPreferencesClient>()));
}
