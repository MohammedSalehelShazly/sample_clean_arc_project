// ignore: depend_on_referenced_packages
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../config/routes/app_route.dart';
import '../../../../config/helpers/helper.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/util/screen_loading.dart';
import '../../../../core/util/snackbars.dart';
import '../../domain/entities/quote_data.dart';
import '../../domain/usecases/get_countries_usecase.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final GetRandomQuoteUsecase getRandomQuoteUsecase;

  MainCubit({required this.getRandomQuoteUsecase}) : super(MainInitial());

  _emit(MainState state) {
    if (state == this.state) emit(TempState());
    emit(state);
  }

  void initHome(BuildContext context) async {
    getQuoteData(context);
  }

  Future<void> afterSplash(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    if (!context.mounted) return;

    Navigator.pushReplacementNamed(context, AppRoutes.home);
  }

  QuoteData? quoteData;
  Future<void> getQuoteData(BuildContext context,
      {bool refresh = false}) async {
    try {
      ScreenLoading.show;
      final result = await getRandomQuoteUsecase();
      result.fold((failure) {
        // if refresh and data was exist => don't show the error to user
        if (!refresh || quoteData == null) {
          AppSnackBar.showFailureSnackBar(context, failure);
        }
        printDB('[getQuoteData] err: ${failure.message}');
      }, (data) {
        quoteData = data;
        _emit(GetQuoteDataState());
      });
    } catch (e) {
      printDB('[getQuoteData] err: $e');
      if (!context.mounted) return;
      AppSnackBar.showFailureSnackBar(context, UnHandledFailure('$e'));
    } finally {
      ScreenLoading.dismiss;
    }
  }
}
