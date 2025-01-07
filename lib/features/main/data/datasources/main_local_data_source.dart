import 'dart:convert';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/shared_preferences_client.dart';
import '../../../../core/strings/app_strings.dart';
import '../models/quote_data_model.dart';

abstract class MainLocalDataSource {
  QuoteDataModel? getRandomQuote();
  Future<bool> cacheRandomQuote(QuoteDataModel quoteDataModel);
}

class MainLocalDataSourceImpl implements MainLocalDataSource {
  final SharedPreferencesClient sharedPreferencesClient;
  const MainLocalDataSourceImpl(this.sharedPreferencesClient);

  @override
  QuoteDataModel? getRandomQuote() {
    final data = sharedPreferencesClient.fetchString(AppStrings.K_random_quote);
    if (data == null) return null;
    final dataDec = jsonDecode(data) as Map<String, dynamic>;
    return QuoteDataModel.fromJson(dataDec);
  }

  @override
  Future<bool> cacheRandomQuote(QuoteDataModel quoteDataModel) async {
    final cached = await sharedPreferencesClient.cacheString(
        AppStrings.K_random_quote, jsonEncode(quoteDataModel.toJson()));
    if (!cached) throw CacheException();
    return true;
  }
}
