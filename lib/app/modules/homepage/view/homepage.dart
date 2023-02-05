// ignore_for_file: prefer_const_constructors
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../widgets/big_text.dart';
import '../controller/homepage_controller.dart';

class HomePage extends GetView<HomePageController> {
  static const route = '/homepage';
  static launch() => Get.toNamed(route);
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF230441),
      body: Container(
          decoration: const BoxDecoration(
            // color: AppColors.black,
            image: DecorationImage(
                image: AssetImage('assets/images/music_app_bckgrnd_img.png'),
                fit: BoxFit.cover),
          ),
          child: SafeArea(
              child: Padding(
            padding: EdgeInsets.only(left: Dimensions.height20, right: Dimensions.height20, top: Dimensions.height20),
            child: Column(
              children: [
                Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.white,
                      backgroundImage: AssetImage('assets/images/applogo.png'),
                    ),
                    SizedBox(width: Dimensions.width15,),
                    BigText(text: 'HEY YA!')
                  ],
                ),
                SizedBox(height: Dimensions.height20),
                Expanded(
                    flex: 11,
                    child: Obx(() => controller.tab[controller.tabIndex])),
                SizedBox(
                  height: Dimensions.height10 / 3,
                )
              ],
            ),
          ))),
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.only(bottom: Dimensions.height10/2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              child: Container(
                width: Dimensions.screenWidth,
                height: Dimensions.height40 * 1.55,
      
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                  color: Color(0xFF747985),
                ),
                child: Row(children: [
                  Image.asset('assets/images/musicPlayImage.png'),
                  SizedBox(
                    width: Dimensions.width30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BigText(
                        text: 'Die Forya',
                        size: Dimensions.font20,
                      ),
                      BigText(text: 'Artist', size: Dimensions.font15),
                    ],
                  ),
                  SizedBox(
                    width: Dimensions.width40 * 3.6,
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.pink,
                    size: 30,
                  ),
                  SizedBox(
                    width: Dimensions.width20,
                  ),
                  GetBuilder<HomePageController>(
                    builder: (controller) {
                      return InkWell(
                          onTap: () {
                            controller.onPressPlay();
                          },
                          child: controller.checkPlayMusic
                              ? Icon(Icons.pause,
                                  color: AppColors.white, size: 33)
                              : Icon(Icons.play_arrow,
                                  color: AppColors.white, size: 33));
                    },
                  )
                ]),
              ),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      controller.onChangeTab(0);
                    },
                    icon: const Icon(
                      Icons.home,
                      size: 26,
                      color: AppColors.white,
                    )),
                IconButton(
                    onPressed: () {
                      controller.onChangeTab(1);
                    },
                    icon: const Icon(Icons.search,
                        size: 26, color: AppColors.white)),
                IconButton(
                  onPressed: () {
                    controller.onChangeTab(2);
                  },
                  icon: const Icon(Icons.public_outlined,
                      size: 26, color: AppColors.white),
                )
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
