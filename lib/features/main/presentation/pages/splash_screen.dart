import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_clean_arc_project/core/util/media_query_values.dart';

import '../../../../config/style/app_colors.dart';
import '../../../../config/style/app_decoration.dart';
import '../cubit/main_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<MainCubit>(context).afterSplash(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColorOpc8,
      body: Container(
        alignment: Alignment.center,
        decoration: AppDecoration.gradientDec,
        child:
            Icon(Icons.format_quote_outlined, size: context.responsiveH * .3),
      ),
    );
  }
}
