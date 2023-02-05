import 'package:flutter/material.dart';
import 'package:get/get.dart';

void snackbar(message) {
  Get.showSnackbar(GetSnackBar(
    duration: Duration(seconds: 3),
    
    backgroundColor: Color(0xFFBEC5D5),
    snackPosition: SnackPosition.TOP,
    messageText: Text(
      message,
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
  ));
}
