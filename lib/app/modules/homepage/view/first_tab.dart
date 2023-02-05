import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/dimensions.dart';
import '../../../../widgets/big_text.dart';
import '../controller/homepage_controller.dart';

class FirstTab extends GetView<HomePageController> {
  static const route = '/firstTab';
  static launch() => Get.toNamed(route);
  const FirstTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(text: 'Recently Played',size: Dimensions.font20*1.4,),
          SizedBox(
            height: Dimensions.height15,
          ),
          SizedBox(
            height: Dimensions.height40 * 5.5,
            width: double.maxFinite,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                    padding: index == 0
                        ? const EdgeInsets.fromLTRB(0, 0, 10, 0)
                        : const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Container(
                          width: Dimensions.height40 * 4,
                          height: Dimensions.height40 * 4,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://mir-s3-cdn-cf.behance.net/project_modules/1400/fe529a64193929.5aca8500ba9ab.jpg'),
                                  fit: BoxFit.fill)),
                        ),
                        SizedBox(height: Dimensions.height15,),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: BigText(
                              text: 'Liked Songs',
                              size: Dimensions.font15,
                            ))
                      ],
                    ));
              },
            ),
          ),
          BigText(text: 'Artists',size: Dimensions.font20*1.4,),
          SizedBox(
            height: Dimensions.height15,
          ),
          SizedBox(
            height: Dimensions.height40 * 5,
            width: double.maxFinite,
            child: GetBuilder<HomePageController>(builder: (controller) => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.artistsList.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: index == 0
                        ? const EdgeInsets.fromLTRB(0, 0, 10, 0)
                        : const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: Dimensions.height40*2,
                          backgroundImage: NetworkImage(controller.artistsList[index]['images'][0]['url']),
                        ),
                        SizedBox(height: Dimensions.height15,),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: BigText(
                              text: controller.artistsList[index]['name'],
                              size: Dimensions.font15,
                            ))
                      ],
                    ));
              },
            ),)
          ),
           BigText(text: 'Albums',size: Dimensions.font20*1.4,),
          SizedBox(
            height: Dimensions.height15,
          ),
          SizedBox(
            height: Dimensions.height40 * 5.5,
            width: double.maxFinite,
            child: GetBuilder<HomePageController>(builder: (controller) => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.albumsList.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: Dimensions.height40*5,
                  child: Padding(
                      padding: index == 0
                          ? const EdgeInsets.fromLTRB(0, 0, 10, 0)
                          : const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Container(
                            width: Dimensions.height40 * 4,
                            height: Dimensions.height40 * 4,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        controller.albumsList[index]['images'][0]['url']),
                                    fit: BoxFit.fill)),
                          ),
                          SizedBox(height: Dimensions.height15,),
                          Align(
                              alignment: Alignment.center,
                              child: BigText(
                                text: controller.albumsList[index]['name'],
                                size: Dimensions.font15,
                              ))
                        ],
                      )),
                );
              },
            ),)
          ),
          BigText(text: 'Recommendation',size: Dimensions.font20*1.4,),
          SizedBox(
            height: Dimensions.height15,
          ),
          SizedBox(
            height: Dimensions.height40*15,
            width: double.maxFinite,
            child: GetBuilder<HomePageController>(builder: (controller) => GridView.builder(
            
                  itemCount: controller.recommendationList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: ((context, index) => SizedBox(
                          // height: Dimensions.height10 * 14,
                          // width: Dimensions.height10 * 14,
                          child: Card(
                        margin: EdgeInsets.all(Dimensions.height10),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20)),
                        elevation: 8,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(Dimensions.radius20) ,
                          child: Image.network(
                              controller.recommendationList[index]['album']['images'][0]['url']),
                        ),
                      )))),)
          )
        ],
      ),
    );
  }
}
