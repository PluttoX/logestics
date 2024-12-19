import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logestics/core/dependancy_injections/app_dependency_injection.dart';
import 'package:logestics/core/router/app_routes.dart';
import 'package:logestics/core/utils/theme/app_theme.dart';

import 'features/authentication/bindings/authentication_dependency_injection.dart';

void main() async {
  // Initialize GetStorage
  WidgetsFlutterBinding.ensureInitialized();
  await AppDependencyInjection().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute:AppRoutes.root,
       initialBinding: AuthenticationDependencyInjection(),
        theme: AppTheme.lightTheme(),
        darkTheme: AppTheme.darkTheme(),
        themeMode: ThemeMode.system,
        getPages: AppRoutes.getPages,
    debugShowCheckedModeBanner: false,
    );

  }
}
