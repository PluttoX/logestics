
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';
import 'package:logestics/core/shared_features/theme_management/presentation/controllers/theme_controller.dart';

import 'data/repositories/theme_repository_impl.dart';
import 'domain/repositories/theme_repository.dart';
import 'domain/useCases/theme_use_case.dart';

class ThemeDependencyInjection extends Bindings{


  @override
  void dependencies() {
    Get.lazyPut<GetStorage>(() => GetStorage(),fenix: true);

    // Register Repository
    Get.lazyPut<ThemeRepository>(() => ThemeRepositoryImpl(Get.find()),fenix: true);

    // Register UseCase
    Get.lazyPut<ThemeUseCase>(() => ThemeUseCase(Get.find()),fenix: true);
    Get.put<ThemeController>( ThemeController(Get.find()),);
  }
}