import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'config/routes/app_route.dart';
import 'config/style/app_theme.dart';
import 'dependency_inject/dependency_inject_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependInject();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      builder: EasyLoading.init(),
    );
  }
}
