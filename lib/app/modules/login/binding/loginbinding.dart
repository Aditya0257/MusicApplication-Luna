import 'package:get/get.dart';

import '../controller/logincontroller.dart';


class LoginPageBinding implements Bindings{
  @override
  void dependencies(){
    Get.lazyPut(() => LoginPageController()
);
  }
}