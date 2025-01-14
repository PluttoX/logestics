
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../authentication/domain/useCases/sign_out_use_case.dart';
import '../view/apps/KanbanBoard/kanban_board_screen.dart';
import '../view/apps/calendar_screen_view.dart';
import '../view/apps/chat/chat_screen_view.dart';
import '../view/apps/contacts_list_screen_view.dart';
import '../view/apps/email/compose_screen_view.dart';
import '../view/apps/email/inbox_screen.dart';
import '../view/apps/email/read_screen_view.dart';
import '../view/apps/file_manager/file_manager.dart';
import '../view/system/invoices/presentation/invoice_screen_view.dart';
import '../view/dashbord/crm/crm.dart';
import '../view/dashbord/e_commerece/e_commerce.dart';
import '../view/dashbord/help_desk/help_desk.dart';
import '../view/dashbord/lms/lms.dart';
import '../view/dashbord/project_management/project_management.dart';
import '../view/modules/ui_elements/Avatars/avatars_screen.dart';
import '../view/modules/ui_elements/Badges/badges_screen.dart';
import '../view/modules/ui_elements/BottomSheet/bottom_sheet_screen.dart';
import '../view/modules/ui_elements/ButtonToggle/button_toggle_screen.dart';
import '../view/modules/ui_elements/Buttons/buttons_screen.dart';
import '../view/modules/ui_elements/CardsAndMaterialCards/cards_and_m_cards_screen.dart';
import '../view/modules/ui_elements/Carousels/carousels_screen.dart';
import '../view/modules/ui_elements/Checkbox/checkbox_screen.dart';
import '../view/modules/ui_elements/Chips/chips_screen.dart';
import '../view/modules/ui_elements/ColorPicker/color_picker_screen.dart';
import '../view/modules/ui_elements/Datepicker/datepicker_screen.dart';
import '../view/modules/ui_elements/Dialog/dialog_screen.dart';
import '../view/modules/ui_elements/Divider/divider_screen.dart';
import '../view/modules/ui_elements/DragandDrop/drag_and_drop_screen.dart';
import '../view/modules/ui_elements/accordion_screen.dart';
import '../view/modules/ui_elements/alerts/alerts_screen.dart';
import '../view/modules/ui_elements/autocomplete_screen.dart';
import '../view/modules/ui_elements/breadcrumb_screen.dart';
import '../view/modules/ui_elements/clipboard_screen.dart';
import '../view/pages/e-commerce/Categories/categories_screen.dart';
import '../view/pages/e-commerce/Categories/create_and_edit_category.dart';
import '../view/pages/e-commerce/Customers/CustomerDetails/customer_details_screen.dart';
import '../view/pages/e-commerce/Customers/customers_screen.dart';
import '../view/pages/e-commerce/Orders/CreateOrder/create_order.dart';
import '../view/pages/e-commerce/Orders/OrderTracking/order_tracking_screen.dart';
import '../view/pages/e-commerce/Orders/Order_Details/order_details_screen.dart';
import '../view/pages/e-commerce/Orders/orders_screen.dart';
import '../view/pages/e-commerce/Sellers/SellerDetails/seller_details_screen.dart';
import '../view/pages/e-commerce/Sellers/create_seller_screen.dart';
import '../view/pages/e-commerce/Sellers/sellers_list_screen.dart';
import '../view/pages/e-commerce/cart/cart_screen.dart';
import '../view/pages/e-commerce/checkout/checkout_screen.dart';
import '../view/pages/e-commerce/products/create_and_edit_product/create_and_edit_product_screen.dart';
import '../view/pages/e-commerce/products/products-grid/products_grid_screen.dart';
import '../view/pages/e-commerce/products/products_details/products_details_screen.dart';
import '../view/pages/e-commerce/products/products_list_screen.dart';
import '../view/pages/e-commerce/refunds_screen.dart';
import '../view/pages/e-commerce/reviews_screen.dart';


class MainDrawerController extends GetxController implements GetxService {




  var isLoading = false.obs;
  var errorMessage = ''.obs;
  int selectControllers = 0;
  Future<void> signOut() async {
    isLoading.value = true;
    errorMessage.value = '';

    final result = await Get.find<SignOutUseCase>().execute();

    result.fold(
          (failure) {
        errorMessage.value = failure.message;
        isLoading.value = false;
      },
          (_) {
        isLoading.value = false;
        // Navigate to login screen or perform other post-logout actions this hapepd by firebase_auth_service

      },
    );
  }
  List pages = [
    const ECommercePageView(),
    const CRMPageView(),
    const ProjectManagementView(),
    const LmsPageView(),
    const HelpDeskView(),
    //ToDoListView(),
    const InvoiceScreenView(),
    const CalendarScreenView(),
    const ContactsListScreenView(),
    const ChatScreenView(),
    const KanbanBoardScreen(),
    const InboxScreenView(),
    const ComposeScreenView(),
    const ReadScreenView(),
    const FileManagerView(),
    const FileManagerView(),
    const FileManagerView(),
    const FileManagerView(),
    const FileManagerView(),
    const FileManagerView(),
    const FileManagerView(),
    const ProductsGridScreen(),
    const ProductsListScreen(),
    const ProductsDetailsScreen(),
    const CreateandEditProductScreen(),
    const CreateandEditProductScreen(editProduct: true),
    const CartScreen(),
    const CheckoutScreen(),
    const OrdersScreen(),
    const OrderDetailsScreen(),
    const CreateOrder(),
    const OrderTrackingScreen(),
    const CustomersScreen(),
    const CustomerDetailsScreen(),
    const CategoriesScreen(),
    const CreateandEditCategory(),
    const CreateandEditCategory(editCategory: true),
    const SellersListScreen(),
    const SellerDetailsScreen(),
    const CreateSellerScreen(),
    const ReviewsScreen(),
    const RefundsScreen(),
    const AlertsScreen(),
    const AutocompleteScreen(),
    const AvatarsScreen(),
    const AccordionScreen(),
    const BadgesScreen(),
    const BreadcrumbScreen(),
    const ButtonToggleScreen(),
    const BottomSheetScreen(),
    const ButtonsScreen(),
    const CardsandMaterialCardsScreen(),
    const CarouselsScreen(),
    const CheckboxScreen(),
    const ChipsScreen(),
    const ClipboardScreen(),
    const ColorPickerScreen(),
    const DatepickerScreen(),
    const DialogScreen(),
    const DividerScreen(),
    const DragAndDropScreen(),
  ];

  updateSelectedIndex(int value) {
    selectControllers = value;
    update();
    debugPrint(
      "=============== selectcontrollers : [$selectControllers] ===============",
    );
  }
}
