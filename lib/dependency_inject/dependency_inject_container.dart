// dependency injection
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/network/dio_client.dart';
import '../core/network/network_info.dart';
import '../core/network/shared_preferences_client.dart';
import '../features/main/data/datasources/main_local_data_source.dart';
import '../features/main/data/datasources/main_remote_data_source.dart';
import '../features/main/data/repositories/main_repository_impl.dart';
import '../features/main/domain/repositories/main_repository.dart';
import '../features/main/domain/usecases/get_countries_usecase.dart';
import '../features/main/presentation/cubit/main_cubit.dart';

part 'cores.dart';
part 'cubits.dart';
part 'data_sources.dart';
part 'external_pkgs.dart';
part 'repositories.dart';
part 'usecases.dart';

final getItInst = GetIt.instance;

Future<void> initDependInject() async {
  _cubits();

  _usecases();

  _repositories();

  _dataSources();

  _cores();

  await _externalPkgs();
}
