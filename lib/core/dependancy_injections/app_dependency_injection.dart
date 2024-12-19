import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get_storage/get_storage.dart';

import '../../firebase_options.dart';
import '../shared_features/theme_management/theme_dependency_injection.dart';
class AppDependencyInjection {

  Future<void> init() async{
    try {
      await GetStorage.init();
      usePathUrlStrategy(); //Todo server side single page configration
      ThemeDependencyInjection().dependencies();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,);
      //AuthenticationDependencyInjection().dependencies();

    }catch (e){
      print('error $e');
    }
    // Register Controller
  }
}