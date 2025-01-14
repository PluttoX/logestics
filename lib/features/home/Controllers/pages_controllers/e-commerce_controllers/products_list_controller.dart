import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsListController extends GetxController implements GetxService {
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

  List productId = [
    "134",
    "240",
    "269",
    "346",
    "369",
    "436",
    "536",
    "679",
    "751",
    "854",
    "854",
    "751",
    "679",
    "536",
    "436",
    "369",
    "346",
    "269",
    "240",
    "134",
  ];

  List productImage = [
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
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8vBdS8WOtP0NqtKtgFqGYTrFDj9g2uJ1xluENuMHaFyQPX402mS2dnKQ6Gdda9KGpZeU&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0KVypvpG8ULXx6MTf4wQvPXuSdqmbWIpNjw&s",
    "https://cdn.pixabay.com/photo/2022/08/16/04/52/jewel-7389356_640.jpg",
  ];

  List productName = [
    "Luxury Rendering",
    "Mobile Device",
    "Gaming Laptop",
    "Wireless Headphone",
    "Hand Watch",
    "Futuristic Bracelet",
    "Triblend T-shirt",
    "Sports Shoes",
    "Woman Handbag",
    "Luxury Rendering",
    "Mobile Device",
    "Gaming Laptop",
    "Wireless Headphone",
    "Hand Watch",
    "Futuristic Bracelet",
    "Triblend T-shirt",
    "Sports Shoes",
    "Futuristic Bracelet",
    "Woman Handbag",
    "Luxury Rendering",
  ];

  List category = [
    "Jewellery",
    "Electronics",
    "Electronics",
    "Electronics",
    "Watch",
    "Accessories",
    "Fashion",
    "Sports",
    "Fashion",
    "Jewellery",
    "Electronics",
    "Electronics",
    "Electronics",
    "Watch",
    "Accessories",
    "Fashion",
    "Accessories",
    "Sports",
    "Fashion",
    "Electronics",
  ];

  List price = [
    "80",
    "750",
    "45",
    "55",
    "75",
    "25",
    "120",
    "150",
    "15",
    "100",
    "100",
    "15",
    "150",
    "120",
    "25",
    "75",
    "55",
    "45",
    "750",
    "80",
  ];

  List stockQuantity = [
    "250",
    "120",
    "50",
    "350",
    "100",
    "900",
    "250",
    "500",
    "1200",
    "50",
    "50",
    "1200",
    "500",
    "250",
    "900",
    "100",
    "350",
    "50",
    "120",
    "250",
  ];

  List date = [
    "Nov 10,2024",
    "Nov 15,2024",
    "Nov 16,2024",
    "Nov 17,2024",
    "Nov 18,2024",
    "Nov 19,2024",
    "Nov 20,2024",
    "Nov 21,2024",
    "Nov 22,2024",
    "Nov 23,2024",
    "Nov 23,2024",
    "Nov 22,2024",
    "Nov 21,2024",
    "Nov 20,2024",
    "Nov 19,2024",
    "Nov 18,2024",
    "Nov 17,2024",
    "Nov 16,2024",
    "Nov 15,2024",
    "Nov 10,2024",
  ];

  List sales = [
    "120",
    "99",
    "45",
    "200",
    "80",
    "450",
    "180",
    "320",
    "1050",
    "40",
    "40",
    "1050",
    "320",
    "180",
    "450",
    "80",
    "200",
    "45",
    "99",
    "120",
  ];

  List revenue = [
    "9,600.00",
    "74,250.00",
    "2,025.00",
    "70,000.00",
    "6,000.00",
    "11,250.00",
    "21,600.00",
    "48,000.00",
    "15,750.00",
    "4,000.00",
    "4,000.00",
    "15,750.00",
    "48,000.00",
    "21,600.00",
    "11,250.00",
    "6,000.00",
    "70,000.00",
    "2,025.00",
    "74,250.00",
    "9,600.00",
  ];

  List rating = [
    "5.00 (141 reviews)",
    "5.00 (69 reviews)",
    "5.00 (99 reviews)",
    "4.00 (75 reviews)",
    "5.00 (158 reviews)",
    "4.00 (250 reviews)",
    "5.00 (42 reviews)",
    "5.00 (248 reviews)",
    "5.00 (858 reviews)",
    "5.00 (30 reviews)",
    "5.00 (30 reviews)",
    "5.00 (858 reviews)",
    "5.00 (248 reviews)",
    "5.00 (42 reviews)",
    "4.00 (250 reviews)",
    "5.00 (158 reviews)",
    "4.00 (75 reviews)",
    "5.00 (99 reviews)",
    "5.00 (69 reviews)",
    "5.00 (141 reviews)",
  ];
}
