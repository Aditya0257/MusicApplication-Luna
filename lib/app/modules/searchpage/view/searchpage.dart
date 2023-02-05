import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luna/utils/colors.dart';
import 'package:luna/widgets/big_text.dart';

import '../../../../utils/dimensions.dart';
import '../../../../widgets/checkbox.dart';
import '../controller/searchcontroller.dart';

class SearchPage extends GetView<SearchPageController> {
  static const route = '/search-page';
  static launch() => Get.toNamed(route);
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Align(
              alignment: Alignment.centerLeft,
              child: BigText(
                text: 'Search',
                size: Dimensions.font26*1.1,
                color: AppColors.white,
              )),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: Dimensions.width40 * 8,
                height: Dimensions.height40 * 1.2,
                margin: EdgeInsets.symmetric(vertical: Dimensions.width30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(Dimensions.radius20 / 2)),
                    border: Border.all(color: AppColors.dimWhite),
                    color: AppColors.dimWhite),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,

                      hint: Text(
                        '',
                        style: TextStyle(
                          fontSize: Dimensions.font15,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: controller.searchList
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: Dimensions.font15,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: controller.selectedValue,
                      onChanged: (value) {
                        controller.onSearchChange(value.toString());
                      },
                      buttonHeight: Dimensions.height40,
                      buttonWidth: Dimensions.width40 * 5,
                      itemHeight: Dimensions.height40,
                      dropdownMaxHeight: Dimensions.height40 * 5,
                      searchController: controller.bankNameController,
                      searchInnerWidget: Padding(
                        padding: EdgeInsets.only(
                          top: Dimensions.height40 / 5,
                          bottom: Dimensions.height40 / 10,
                          right: Dimensions.height40 / 5,
                          left: Dimensions.height40 / 5,
                        ),
                        child: TextFormField(
                          controller: controller.bankNameController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: Dimensions.height10,
                              vertical: Dimensions.height40 / 5,
                            ),
                            hintText: 'Search Here...',
                            hintStyle:
                                TextStyle(fontSize: Dimensions.font26 / 2),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.radius20 / 2.5),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return (item.value.toString().contains(searchValue));
                      },
                      //This to clear the search value when you close the menu
                      onMenuStateChange: (isOpen) {
                        if (!isOpen) {
                          controller.bankNameController.clear();
                        }
                      },
                    ),
                  ),
                ),
              ),
              Icon(
                Icons.mic,
                color: AppColors.dimWhite,
                size: Dimensions.iconSize24 * 1.2,
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: BigText(
            text: 'Browse All',
            color: AppColors.dimWhite,
          ),
        ),
        Expanded(
            flex: 6,
            child: GetBuilder<SearchPageController>(builder: (_)=>GridView.builder(
                itemCount: controller.categoriesList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: ((context, index) => SizedBox(
                        height: Dimensions.height10 * 14,
                        width: Dimensions.height10 * 14,
                        child: Card(
                      margin: EdgeInsets.all(Dimensions.height10),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20)),
                      elevation: 8,
                      child: Padding(
                        padding: EdgeInsets.all(Dimensions.height10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            
                            Expanded(
                                child: Image.network(
                                    controller.categoriesList[index]['icons'][0]['url'])),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: BigText(
                                text: controller.categoriesList[index]['name'],
                                size: Dimensions.font20 / 1.5,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    )))))),
                    SizedBox(height: Dimensions.height20,),
        
      ],
    );
  }
}