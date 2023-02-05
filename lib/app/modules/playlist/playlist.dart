import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luna/app/modules/homepage/controller/homepage_controller.dart';
import 'package:luna/utils/colors.dart';
import 'package:luna/widgets/big_text.dart';
import 'package:luna/widgets/button.dart';
import 'package:luna/widgets/small_text.dart';

import '../../../../utils/dimensions.dart';

class PlaylistPage extends GetView<HomePageController> {
  static const route = '/playlist-page';
  static launch() => Get.toNamed(route);
  const PlaylistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF230441),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            child: Container(
              width: Dimensions.screenWidth,
              height: Dimensions.height40 * 1.6,

              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                color: const Color(0xFF747985),
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
                const Icon(
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
                            ? const Icon(Icons.pause,
                                color: AppColors.white, size: 30)
                            : const Icon(Icons.play_arrow,
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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/music_app_bckgrnd_img.png'),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.only(
              top: Dimensions.height40 * 1.5, bottom: Dimensions.height40),
          child: Column(
            children: [
              SizedBox(
                height: Dimensions.height10 * 1.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: Dimensions.height40 * 3.2,
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              size: 32,
                              color: AppColors.white,
                            ))),
                  ),
                  CircleAvatar(
                    radius: Dimensions.radius30 * 2.2,
                    backgroundImage: const NetworkImage(
                        "https://i.scdn.co/image/ab67616d00001e02a5fc248d94f3d3062576fbae"),
                  ),
                  BigText(
                    text: 'Playlist',
                    color: AppColors.white,
                    size: Dimensions.font20 * 1.5,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button(
                    on_pressed: () {},
                    text: 'Shuffle All',
                    width: Dimensions.width40 * 4,
                    height: Dimensions.height40 * 1.3,
                    color: const Color(0xFFCBC3E3),
                    textColor: AppColors.black,
                  ),
                  SizedBox(
                    width: Dimensions.width20,
                  ),
                  Button(
                      on_pressed: () {},
                      text: 'Play All',
                      width: Dimensions.width40 * 4,
                      height: Dimensions.height40 * 1.3,
                      color: const Color(0xFFCBC3E3),
                      textColor: AppColors.black)
                ],
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              Expanded(
                child: GetBuilder<HomePageController>(
                  init: HomePageController(),
                  builder: (controller) {
                    return ListView.builder(
                        itemCount: controller.recommendationList.length,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              children: [
                                Container(
                                    width: Dimensions.width40 * 1.3,
                                    height: Dimensions.height40 * 1.3,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                Dimensions.radius15 / 2)),
                                        color: AppColors.dimWhite),
                                    child: Image.network(
                                      controller.recommendationList[index]
                                          ['album']['images'][0]['url'],
                                      fit: BoxFit.cover,
                                    )),
                                SizedBox(
                                  width: Dimensions.width30,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BigText(
                                      text: controller.recommendationList[index]
                                          ['album']['artists'][0]['name'],
                                      size: Dimensions.font20,
                                      color: AppColors.dimWhite,
                                    ),
                                    SizedBox(
                                      height: Dimensions.height10 / 3,
                                    ),
                                    SmallText(
                                      text: 'The Weekend',
                                      color: AppColors.dimWhite,
                                    )
                                  ],
                                ),
                                // SizedBox(
                                //   width: Dimensions.width40 * 3.8,
                                // ),
                                const Spacer(),
                                Icon(
                                  Icons.more_vert,
                                  color: AppColors.dimWhite,
                                  size: Dimensions.iconSize24 * 1.2,
                                )
                              ],
                            ),
                          );
                        }));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
