import 'package:dio/dio.dart';

import '../../config/helpers/helper.dart';
import '../strings/app_strings.dart';

class DioClient {
  final Dio dio;
  const DioClient(this.dio);

  Future<Response> get(
    String path, {
    required String? accessToken,
    Map<String, dynamic>? body,
    Object? data,
    Map<String, dynamic>? headers,
  }) async {
    // headers = _header(accessToken, additionalHeaders: headers);
    if (path.startsWith('http://')) {
      path = path.replaceFirst('http://', 'https://');
    }
    final response =
        await dio.get(path,
            options: Options(
              headers: headers,
              // add those to avoid error 500
              // followRedirects: false,
              // validateStatus: (status) => true,
            ),
            queryParameters: (body?.isEmpty ?? true) ? null : body,
            data: data);
    printDB(
        'GET: -path:$path\n-accessToken:$accessToken\n-statusCode:${response.statusCode}\n-body:$body\n-response:${response.data}');
    return response;
  }

  Map<String, dynamic> _header(String? accessToken,
          {required Map<String, dynamic>? additionalHeaders}) =>
      {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        "Connection": "keep-alive",
        "Accept-Encoding": "gzip, deflate, br",
        if (accessToken != null) 'Authorization': 'Token $accessToken',
      }..addAll(additionalHeaders ?? {});

  String? error(Response response) {
    if (_isSuccess(response.statusCode ?? -1)) return null;

    final returnedData =
        response.data is! String && response.data is Map ? response.data : null;

    if (returnedData == null) return _statusCodeCallback(response.statusCode);

    final returnedMsg = returnedData['error'] ?? returnedData['statusMessage'];
    return returnedMsg;
  }

  bool _isSuccess(int statusCode) => statusCode >= 200 && statusCode <= 299;

  String? _statusCodeCallback(int? statusCode) {
    statusCode ??= -1;
    if (statusCode >= 100 && statusCode <= 199) {
      return '${AppStrings.tr_error} $statusCode ${AppStrings.tr_err_100_199}';
    } else if (_isSuccess(statusCode)) {
      return null; // Successful responses
    } else if (statusCode >= 300 && statusCode <= 399) {
      return '${AppStrings.tr_error} $statusCode ${AppStrings.tr_err_300_399}';
    } else if (statusCode >= 400 && statusCode <= 499) {
      return '${AppStrings.tr_error} $statusCode ${AppStrings.tr_err_400_499}';
    } else if (statusCode >= 500 && statusCode <= 599) {
      return '${AppStrings.tr_error} $statusCode ${AppStrings.tr_err_500_599}';
    } else {
      return '${AppStrings.tr_error} $statusCode ${AppStrings.tr_err_unknown}';
    }
  }
}
