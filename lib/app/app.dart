import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/routes.dart';
import 'modules/homepage/view/homepage.dart';
import 'modules/login/view/loginpage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'RedHat'
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.pages,
      initialRoute: HomePage.route,
    );
  }
}

