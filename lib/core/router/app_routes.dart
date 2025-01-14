import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:logestics/features/dashboard/bindings/dashboard_screen_controller_bindings.dart';
import 'package:logestics/features/dashboard/presentation/screens/dashboard_screen/dashboard_screen.dart';
import 'package:logestics/features/home/view/system/company/utils/di/company_binding.dart';
import 'package:logestics/features/home/view/system/invoices/presentation/add_invoice_view.dart';
import '../../features/authentication/bindings/forget_component_controller_binding.dart';
import '../../features/authentication/bindings/login_component_controller_binding.dart';
import '../../features/authentication/presentation/screens/forget_screen/forget_password_screen.dart';
import '../../features/authentication/presentation/screens/login_screen/login_screen.dart';
import '../../features/authentication/presentation/screens/root_screen.dart';
import '../../features/dashboard/utils/middle_wares/dashboard_auth_middle_were.dart';
import '../../features/home/utils/bindings/home_binding.dart';
import '../../features/home/view/home_page.dart';
import '../../features/home/view/system/invoices/utils/di/add_invoice_binding.dart';

class AppRoutes {
  static const root = '/';
  static const String login = '/login';
  static const String forgotPassword = '/forgot-password';
  static const String dashboard = '/dashboard';
  static const String home='/home';
  static const String addInvoice='/add-invoice';

  static final getPages = [
    GetPage(name: root, page: () => const RootScreen()),
    GetPage(
        name: login,
        page: () => const LoginScreen(),
        binding: LoginComponentControllerBinding()),
    GetPage(
      name: forgotPassword,
      page: () => const ForgetPasswordScreen(),
      binding: ForgetPasswordComponentControllerBinding(),
    ),
    GetPage(
      name: dashboard,
      page: () => DashboardScreen(),
      middlewares: [AuthMiddleware()],
      bindings: [DashboardScreenControllerBindings()]
    ),
    GetPage(
        name: home,
        page: () =>  const MyHomePage(),
        middlewares: [AuthMiddleware()],
        bindings: [CompanyBinding(),HomeBinding()]
       ),
    GetPage(
      name: addInvoice,
      page: () =>  AddNewInvoiceForm(),
      binding: AddInvoiceBinding(),
    ),

  ];
}
