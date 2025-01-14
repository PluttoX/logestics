import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logestics/core/dependancy_injections/app_dependency_injection.dart';
import 'package:logestics/core/router/app_routes.dart';
import 'package:provider/provider.dart';

import 'features/authentication/bindings/authentication_dependency_injection.dart';
import 'features/home/theme/theme.dart';
import 'features/home/widget/scrolling.dart';

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

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ColorNotifier(),
        ),
      ],
      child: Builder(
        builder: (context) {
        var  notifier = Provider.of<ColorNotifier>(context, listen: true);
          return GetMaterialApp(
            initialRoute:AppRoutes.home,
             initialBinding: AuthenticationDependencyInjection(),
              theme:ThemeData(
                appBarTheme: AppBarTheme(
                  scrolledUnderElevation: 0,
                  elevation: 0,
                  iconTheme: IconThemeData(color: notifier.text),
                ),
                primaryColor: const Color(0xFF0f79f3),
                fontFamily: "Outfit",
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              )/* AppTheme.lightTheme(MediaQuery.of(context).devicePixelRatio)*/,
             // darkTheme: AppTheme.darkTheme(MediaQuery.of(context).devicePixelRatio),
             // themeMode: ThemeMode.system,
              getPages: AppRoutes.getPages,
          debugShowCheckedModeBanner: false,
            scrollBehavior: MyCustomScrollerBehavior(),
          );
        }
      ),
    );

  }
}
