import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:logestics/features/dashboard/presentation/screens/dashbaord_screen/dash_board_screen.dart';
import '../../features/authentication/bindings/forget_component_controller_binding.dart';
import '../../features/authentication/bindings/login_component_controller_binding.dart';
import '../../features/authentication/presentation/screens/forget_screen/forget_password_screen.dart';
import '../../features/authentication/presentation/screens/login_screen/login_screen.dart';
import '../../features/authentication/presentation/screens/root_screen.dart';
import '../../features/dashboard/utils/middle_wares/dashboard_auth_middle_were.dart';

class AppRoutes {
  static const root = '/';
  static const String login = '/login';
  static const String forgotPassword = '/forgot-password';
  static const String dashboard = '/dashboard';
  static final getPages = [
    GetPage(name: root, page: () => RootScreen()),
    GetPage(
        name: login,
        page: () => LoginScreen(),
        binding: LoginComponentControllerBinding()),
    GetPage(
      name: forgotPassword,
      page: () => ForgetPasswordScreen(),
      binding: ForgetPasswordComponentControllerBinding()
    ),
    GetPage(
      name: dashboard,
      page: () => DashBoardScreen(),
      middlewares: [AuthMiddleware()],
    ),
  ];
}
