import 'package:get/get.dart';
import 'package:luna/app/modules/homepage/controller/homepage_controller.dart';
import 'package:luna/app/modules/playlist/playlist.dart';
import 'package:luna/app/modules/searchpage/binding/searchbinding.dart';
import 'package:luna/app/modules/searchpage/view/searchpage.dart';
import 'package:luna/app/modules/track/view/track.dart';

import '../app/modules/homepage/binding/homepage_binding.dart';
import '../app/modules/homepage/view/first_tab.dart';
import '../app/modules/homepage/view/homepage.dart';
import '../app/modules/login/binding/loginbinding.dart';
import '../app/modules/login/view/loginpage.dart';


class AppRoutes {
  static final pages = [
    GetPage(
      name: LoginPage.route,
      page: () => const LoginPage(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: HomePage.route,
      page: () =>  HomePage(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: FirstTab.route,
      page: () => const FirstTab(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: Profile.route,
      page: () => const Profile(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: SearchPage.route,
      page: () => const SearchPage(),
      binding: SearchPageBinding(),
    ),
    GetPage(name: PlaylistPage.route, page: (() => PlaylistPage()),binding: HomePageBinding())
    
    // GetPage(
    //   name: FirstPage.route,
    //   page: () => FirstPage(),
    // ),
  ];
}
