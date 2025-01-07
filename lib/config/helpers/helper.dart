import 'dart:developer' as dev;

import '../../core/error/failure.dart';
import '../../core/strings/translation.dart';
import '../constants/app_const.dart';

class Helper {
  static String failureMessage(Failure failure) =>
      failure.message ??
      switch (failure.runtimeType) {
        const (ServerFailure) => tr_err_server,
        const (OfflineFailure) => tr_err_no_internet,
        const (EmptyCacheFailure) => tr_err_empty_cached_data,
        const (LocalPermissionFailure) => tr_err_local_permission_denied,
        const (CacheFailure) => tr_err_cache_failure,
        _ => tr_err_unexpected
      };
}

printDB(Object? object, {bool logged = true}) {
  if (AppConst.isDebug) {
    if (logged) {
      dev.log(object.toString());
    } else {
      print(object);
    }
  }
}
