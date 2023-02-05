import 'package:get/get.dart';

import '../../searchpage/controller/searchcontroller.dart';
import '../controller/homepage_controller.dart';

class HomePageBinding implements Bindings{
  @override
  void dependencies(){
    Get.lazyPut(() => HomePageController());
    Get.lazyPut(() => SearchPageController());

  }
}