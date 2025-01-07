// ignore_for_file: constant_identifier_names

import 'dart:math';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/strings/base_urls.dart';
import '../models/quote_data_model.dart';

abstract class MainRemoteDataSource {
  Future<QuoteDataModel> getRandomQuote();
}

class MainRemoteDataSourceImpl implements MainRemoteDataSource {
  const MainRemoteDataSourceImpl(this.dioClient);

  final DioClient dioClient;

  @override
  Future<QuoteDataModel> getRandomQuote() async {
    final gettingID = Random().nextInt(99) + 1;
    final response = await dioClient.get(BaseUrls.random_quote(gettingID),
        accessToken: null);
    final error = dioClient.error(response);
    if (error != null) throw ServerException(error);
    return QuoteDataModel.fromJson(response.data);
  }
}
