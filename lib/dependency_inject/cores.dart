part of 'dependency_inject_container.dart';

void _cores() {
  getItInst.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(getItInst<InternetConnectionChecker>()));

  getItInst.registerLazySingleton<DioClient>(() => DioClient(getItInst<Dio>()));

  getItInst.registerLazySingleton<SharedPreferencesClient>(
      () => SharedPreferencesClient(getItInst<SharedPreferences>()));
}
