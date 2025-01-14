import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/stringfile.dart';

class ReviewsController extends GetxController implements GetxService {
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

  List id = [
    "#134",
    "#312",
    "#532",
    "#142",
    "#564",
    "#175",
    "#122",
    "#875",
    "#412",
    "#897",
    "#897",
    "#412",
    "#875",
    "#122",
    "#175",
    "#564",
    "#142",
    "#532",
    "#312",
    "#134",
  ];

  List productImages = [
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
    "https://cdn.pixabay.com/photo/2022/08/16/04/52/jewel-7389356_640.jpg",
    "https://images.pexels.com/photos/277390/pexels-photo-277390.jpeg?cs=srgb&dl=pexels-pixabay-277390.jpg&fm=jpg",
  ];

  List productName = [
    "Luxury Rendering",
    "Mobile Device",
    "Gaming Laptop",
    "Wireless Headphone",
    "Yellow watch",
    "Futuristic Bracelet",
    "Triblend T-shirt",
    "Sports Shoes",
    "Woman Handbag",
    "Luxury Rendering",
    "Camera Lens",
    "Camera Lens",
    "Triblend T-shirt",
    "Mobile Device",
    "Futuristic Bracelet",
    "Wireless Headphone",
    "Jewellery",
    "Woman Handbag",
    "Gaming Laptop",
    "Hand Watch",
  ];

  List customerImages = [
    "assets/images/artist.png",
    "assets/images/avatar-1-51c6502a 1.png",
    "assets/images/avatar-6 1.png",
    "assets/images/avatar-7 1.png",
    "assets/images/avatar-8 1.png",
    "assets/images/download 1.png",
    "assets/images/artist.png",
    "assets/images/avatar-1-51c6502a 1.png",
    "assets/images/avatar-6 1.png",
    "assets/images/avatar-7 1.png",
    "assets/images/avatar-8 1.png",
    "assets/images/download 1.png",
    "assets/images/artist.png",
    "assets/images/avatar-1-51c6502a 1.png",
    "assets/images/avatar-6 1.png",
    "assets/images/avatar-7 1.png",
    "assets/images/avatar-8 1.png",
    "assets/images/download 1.png",
    "assets/images/avatar-1-51c6502a 1.png",
    "assets/images/avatar-7 1.png",
  ];

  List customerNames = [
    AllString.user1,
    AllString.user2,
    AllString.user3,
    AllString.user4,
    AllString.user5,
    AllString.user6,
    AllString.user1,
    AllString.user2,
    AllString.user3,
    AllString.user4,
    AllString.user5,
    AllString.user6,
    AllString.user1,
    AllString.user2,
    AllString.user3,
    AllString.user4,
    AllString.user5,
    AllString.user6,
    AllString.user2,
    AllString.user4,
  ];

  List customerReviews = [
    "Auctor in nam malesuada auctor ultrices proin condimentum leo cras. Ultrices a quam massa tincidunt dictum luctus cursus.",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard.",
    "When an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",
    "Ultrices a quam massa tincidunt dictum luctus cursus.",
    "Auctor in nam malesuada auctor ultrices proin condimentum leo cras. Ultrices a quam massa tincidunt dictum luctus cursus.",
    "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    "Ultrices a quam massa tincidunt dictum luctus cursus.",
    "Auctor in nam malesuada auctor ultrices proin condimentum leo cras.",
    "Auctor in nam malesuada auctor ultrices proin condimentum leo cras.",
    "Ultrices a quam massa tincidunt dictum luctus cursus.",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",
    "Auctor in nam malesuada auctor ultrices proin condimentum leo cras. Ultrices a quam massa tincidunt dictum luctus cursus.",
    "Ultrices a quam massa tincidunt dictum luctus cursus.",
    "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",
    "When an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard.",
    "Auctor in nam malesuada auctor ultrices proin condimentum leo cras. Ultrices a quam massa tincidunt dictum luctus cursus.",
  ];

  List rating = [
    "5.0",
    "4.5",
    "4.0",
    "3.5",
    "3.0",
    "5.0",
    "4.5",
    "5.0",
    "5.0",
    "4.0",
    "4.0",
    "5.0",
    "5.0",
    "4.5",
    "5.0",
    "3.0",
    "3.5",
    "4.0",
    "4.5",
    "5.0",
  ];

  List date = [
    "Nov 10, 2024",
    "Nov 11, 2024",
    "Nov 12, 2024",
    "Nov 13, 2024",
    "Nov 14, 2024",
    "Nov 15, 2024",
    "Nov 16, 2024",
    "Nov 17, 2024",
    "Nov 18, 2024",
    "Nov 19, 2024",
    "Nov 19, 2024",
    "Nov 18, 2024",
    "Nov 17, 2024",
    "Nov 16, 2024",
    "Nov 15, 2024",
    "Nov 14, 2024",
    "Nov 13, 2024",
    "Nov 12, 2024",
    "Nov 11, 2024",
    "Nov 10, 2024",
  ];

  List status = [
    "Approved",
    "Pending",
    "Approved",
    "Rejected",
    "Pending",
    "Approved",
    "Approved",
    "Rejected",
    "Approved",
    "Pending",
    "Pending",
    "Approved",
    "Rejected",
    "Approved",
    "Approved",
    "Pending",
    "Rejected",
    "Approved",
    "Pending",
    "Approved",
  ];

  List<Color> statusTextColors = [
    Color(0xFF2c7ef3),
    Color(0xFFffb872),
    Color(0xFF2c7ef3),
    Color(0xFFe75042),
    Color(0xFFffb872),
    Color(0xFF2c7ef3),
    Color(0xFF2c7ef3),
    Color(0xFFe75042),
    Color(0xFF2c7ef3),
    Color(0xFFffb872),
    Color(0xFFffb872),
    Color(0xFF2c7ef3),
    Color(0xFFe75042),
    Color(0xFF2c7ef3),
    Color(0xFF2c7ef3),
    Color(0xFFffb872),
    Color(0xFFe75042),
    Color(0xFF2c7ef3),
    Color(0xFFffb872),
    Color(0xFF2c7ef3),
  ];
}
