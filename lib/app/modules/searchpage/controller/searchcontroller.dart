import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SearchPageController extends GetxController{
  final List<String> searchList = [
    'Songs',
    'Albums',
    'Artists',
    'Playlists',
    // 'Genres',
    // 'Moods',
    // 'Profiles'
  ];

  bool onCheck = false;

  String? selectedValue;
  onSearchChange(String x) {
    selectedValue = x;
    update();
  }

  final TextEditingController bankNameController = TextEditingController();
  @override
  void onInit()async{
    super.onInit();
    await categories();
   
  }
  List categoriesList=[];
 
  Future<void> categories()async {
    final String response=await rootBundle.loadString('assets/json_dumy_data/categories.json');
    final data=await jsonDecode(response);
    categoriesList=data['categories']['items'];
    update();
  }
}