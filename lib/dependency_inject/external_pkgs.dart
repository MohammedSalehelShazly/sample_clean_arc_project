part of 'dependency_inject_container.dart';

Future<void> _externalPkgs() async {
  // it's make an Error
  // getItInst.registerLazySingletonAsync<SharedPreferences>(() => SharedPreferences.getInstance());
  final sharedPreferencesInst = await SharedPreferences.getInstance();
  getItInst
      .registerLazySingleton<SharedPreferences>(() => sharedPreferencesInst);

  getItInst.registerLazySingleton<Dio>(() => Dio());
  getItInst.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker.instance);
}
