part of 'dependency_inject_container.dart';

void _cubits() {
  getItInst.registerFactory(() => MainCubit(
        getRandomQuoteUsecase: getItInst<GetRandomQuoteUsecase>(),
      ));
}
