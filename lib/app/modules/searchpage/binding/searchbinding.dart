import 'package:get/get.dart';

import '../controller/searchcontroller.dart';

class SearchPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchPageController());
  }
}
