import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../entities/quote_data.dart';

abstract class MainRepository {
  Future<Either<Failure, QuoteData>> getRandomQuote();
}
