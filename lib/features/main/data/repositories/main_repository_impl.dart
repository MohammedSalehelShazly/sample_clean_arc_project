import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/quote_data.dart';
import '../../domain/repositories/main_repository.dart';
import '../datasources/main_local_data_source.dart';
import '../datasources/main_remote_data_source.dart';

class MainRepositoryImpl implements MainRepository {
  final MainLocalDataSource mainLocalDataSource;
  final MainRemoteDataSource mainRemoteDataSource;
  final NetworkInfo networkInfo;
  MainRepositoryImpl(
      {required this.mainLocalDataSource,
      required this.mainRemoteDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, QuoteData>> getRandomQuote() async {
    final isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final data = await mainRemoteDataSource.getRandomQuote();

        await mainLocalDataSource.cacheRandomQuote(data);
        return Right(data);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } on DioException catch (e) {
        return Left(ServerFailure(e.message));
      } on CacheException catch (_) {
        return Left(CacheFailure());
      }
    } else {
      final cachedData = mainLocalDataSource.getRandomQuote();
      if (cachedData == null) return Left(OfflineFailure());
      return Right(cachedData);
    }
  }
}
