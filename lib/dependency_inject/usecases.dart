part of 'dependency_inject_container.dart';

void _usecases() {
  // Main
  getItInst.registerLazySingleton(
      () => GetRandomQuoteUsecase(getItInst<MainRepository>()));
}
