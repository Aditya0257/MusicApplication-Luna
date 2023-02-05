// ignore_for_file: prefer_const_constructors

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../widgets/big_text.dart';
import '../controller/homepage_controller.dart';

class HomePage extends GetView<HomePageController> {
  AudioPlayer _audioPlayer = AudioPlayer();
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
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.white,
                      backgroundImage: AssetImage('assets/images/applogo.png'),
                    ),
                    BigText(text: '  HEY YA!')
                  ],
                ),
                SizedBox(height: Dimensions.height15),
                Expanded(
                    flex: 11,
                    child: Obx(() => controller.tab[controller.tabIndex])),
                SizedBox(
                  height: Dimensions.height10 / 3,
                )
              ],
            ),
          ))),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            child: Container(
              width: Dimensions.screenWidth,
              height: Dimensions.height40 * 1.6,

              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                color: Color(0xFF747985),
              ),
              child: Row(children: [
                Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/2/27/Street_-_Cixqo_Song_Art_Cover.jpg'),
                SizedBox(
                  width: Dimensions.width30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BigText(
                      text: 'After Hours',
                      size: Dimensions.font20,
                    ),
                    BigText(text: 'Weekend', size: Dimensions.font15),
                  ],
                ),
                SizedBox(
                  width: Dimensions.width40 * 3.2,
                ),
                Icon(
                  Icons.heart_broken,
                  color: Colors.pink,
                  size: 30,
                ),
                SizedBox(
                  width: Dimensions.width15,
                ),
                GetBuilder<HomePageController>(
                  builder: (controller) {
                    return InkWell(
                        onTap: () {
                          controller.onPressPlay();
                        },
                        child: controller.checkPlayMusic
                            ? Icon(Icons.pause,
                                color: AppColors.white, size: 30)
                            : Icon(Icons.play_arrow,
                                color: AppColors.white, size: 30));
                  },
                )
              ]),
            ),
          ),
          SizedBox(
            height: Dimensions.height10,
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
          SizedBox(
            height: Dimensions.height30,
          ),
        ],
      ),
    );
  }
}
