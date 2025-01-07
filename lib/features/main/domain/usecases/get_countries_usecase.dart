import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../entities/quote_data.dart';
import '../repositories/main_repository.dart';

class GetRandomQuoteUsecase {
  final MainRepository mainRepository;

  GetRandomQuoteUsecase(this.mainRepository);

  Future<Either<Failure, QuoteData>> call() => mainRepository.getRandomQuote();
}
