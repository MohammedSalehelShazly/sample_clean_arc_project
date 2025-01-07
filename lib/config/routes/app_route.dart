// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dependency_inject/dependency_inject_container.dart';
import '../../features/main/presentation/cubit/main_cubit.dart';
import '../../features/main/presentation/pages/home_page.dart';
import '../../features/main/presentation/pages/splash_screen.dart';
import '../helpers/helper.dart';
import 'undefined_route.dart';

class AppRoutes {
  static const initialRoute = '/';
  static const home = '/home';

  static MaterialPageRoute<dynamic> _pageRout(Widget page) =>
      MaterialPageRoute(builder: (context) => page);

  static Route? onGenerateRoute(RouteSettings routeSettings) {
    printDB('Go To Route ${routeSettings.name}');
    return switch (routeSettings.name) {
      // ..
      initialRoute => _pageRout(BlocProvider.value(
          value: getItInst<MainCubit>(), child: const SplashScreen())),
      // ..
      home => _pageRout(BlocProvider.value(
          value: getItInst<MainCubit>(), child: const HomePage())),
      // ..
      _ => _pageRout(UndefinedRoute(routeSettings.name))
    };
  }
}
