import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController implements GetxService {
  int selectpage = 0;
  int loadmore = 0;

  ScrollController scrollController = ScrollController();

  setloadmore(value) {
    loadmore = value;
    update();
  }

  setpage(value) {
    selectpage = value;
    update();
  }

  int selectindex = 10;

  setindexforitem(value) {
    selectindex = value;
    update();
  }

  List images = [
    "https://cdn.pixabay.com/photo/2022/08/16/04/52/jewel-7389356_640.jpg",
    "https://images.unsplash.com/photo-1515529706504-b440b49fb63b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1484788984921-03950022c9ef?q=80&w=2132&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.pexels.com/photos/815494/pexels-photo-815494.jpeg?cs=srgb&dl=pexels-dzeninalukac-815494.jpg&fm=jpg",
    "https://images.pexels.com/photos/277390/pexels-photo-277390.jpeg?cs=srgb&dl=pexels-pixabay-277390.jpg&fm=jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8vBdS8WOtP0NqtKtgFqGYTrFDj9g2uJ1xluENuMHaFyQPX402mS2dnKQ6Gdda9KGpZeU&usqp=CAU",
    "https://res.cloudinary.com/teepublic/image/private/s--vKPM19YG--/t_Resized%20Artwork/c_crop,x_10,y_10/c_fit,w_470/c_crop,g_north_west,h_626,w_470,x_0,y_0/g_north_west,u_upload:v1462829013:production:blanks:cau9y2yr6rnvk9qkrf1h,x_-395,y_-325/b_rgb:eeeeee/c_limit,f_auto,h_630,q_auto:good:420,w_630/v1614312052/production/designs/19740243_0.jpg",
    "https://redtape.com/cdn/shop/files/RSO3752_1.jpg?v=1711713936",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0KVypvpG8ULXx6MTf4wQvPXuSdqmbWIpNjw&s",
    "https://cdn.pixabay.com/photo/2022/08/16/04/52/jewel-7389356_640.jpg",
    "https://images.unsplash.com/photo-1515529706504-b440b49fb63b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1484788984921-03950022c9ef?q=80&w=2132&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.pexels.com/photos/815494/pexels-photo-815494.jpeg?cs=srgb&dl=pexels-dzeninalukac-815494.jpg&fm=jpg",
    "https://images.pexels.com/photos/277390/pexels-photo-277390.jpeg?cs=srgb&dl=pexels-pixabay-277390.jpg&fm=jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8vBdS8WOtP0NqtKtgFqGYTrFDj9g2uJ1xluENuMHaFyQPX402mS2dnKQ6Gdda9KGpZeU&usqp=CAU",
    "https://res.cloudinary.com/teepublic/image/private/s--vKPM19YG--/t_Resized%20Artwork/c_crop,x_10,y_10/c_fit,w_470/c_crop,g_north_west,h_626,w_470,x_0,y_0/g_north_west,u_upload:v1462829013:production:blanks:cau9y2yr6rnvk9qkrf1h,x_-395,y_-325/b_rgb:eeeeee/c_limit,f_auto,h_630,q_auto:good:420,w_630/v1614312052/production/designs/19740243_0.jpg",
    "https://redtape.com/cdn/shop/files/RSO3752_1.jpg?v=1711713936",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0KVypvpG8ULXx6MTf4wQvPXuSdqmbWIpNjw&s",
    "https://images.pexels.com/photos/277390/pexels-photo-277390.jpeg?cs=srgb&dl=pexels-pixabay-277390.jpg&fm=jpg",
    "https://res.cloudinary.com/teepublic/image/private/s--vKPM19YG--/t_Resized%20Artwork/c_crop,x_10,y_10/c_fit,w_470/c_crop,g_north_west,h_626,w_470,x_0,y_0/g_north_west,u_upload:v1462829013:production:blanks:cau9y2yr6rnvk9qkrf1h,x_-395,y_-325/b_rgb:eeeeee/c_limit,f_auto,h_630,q_auto:good:420,w_630/v1614312052/production/designs/19740243_0.jpg",
  ];

  List name = [
    "Jewelry",
    "Mobile",
    "Laptop",
    "Headphone",
    "Yellow Watch",
    "Futuristic Bracelet",
    "Tri blend T-shirt",
    "Shoe",
    "Bag",
    "Jewelry",
    "Jewelry",
    "Bag",
    "Shoe",
    "Tri blend T-shirt",
    "Yellow Watch",
    "Headphone",
    "Man",
    "Laptop",
    "Mobile",
    "Watch",
  ];

  List totalProducts = [
    54,
    13,
    42,
    32,
    100,
    22,
    64,
    52,
    99,
    34,
    34,
    99,
    52,
    64,
    22,
    100,
    32,
    42,
    13,
    45,
  ];

  List slug = [
    "Watch",
    "Mobile",
    "Laptop",
    "Man",
    "Headphone",
    "Yellow-Watch",
    "Red-Laptop",
    "Shoe",
    "Bag",
    "Jewelry",
    "Jewelry",
    "Bag",
    "Shoe",
    "Red-Laptop",
    "Yellow-Watch",
    "Headphone",
    "Man",
    "Laptop",
    "Mobile",
    "Watch",
  ];

  List description = [
    "What is lorem ipsum?",
    "Why do we use it?",
    "Where does it come from?",
    "Where can I get some?",
    "Contrary to popular belief",
    "There are many variations",
    "The standard chunk of lorem",
    "Non-characteristic words etc",
    "Can you help translate this",
    "If you use this site regularly",
    "If you use this site regularly",
    "Can you help translate this",
    "Non-characteristic words etc",
    "The standard chunk of lorem",
    "There are many variations",
    "Contrary to popular belief",
    "Where can I get some?",
    "Where does it come from?",
    "Why do we use it?",
    "What is lorem ipsum?",
  ];

  List status = [
    "Active",
    "Active",
    "Deactive",
    "Active",
    "Deactive",
    "Active",
    "Active",
    "Deactive",
    "Active",
    "Active",
    "Active",
    "Active",
    "Deactive",
    "Active",
    "Active",
    "Deactive",
    "Active",
    "Deactive",
    "Active",
    "Active",
  ];
}
