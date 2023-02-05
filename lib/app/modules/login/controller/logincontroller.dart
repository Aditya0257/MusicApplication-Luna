import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../helper/loading.dart';
import '../../../../helper/shared_preference.dart';
import '../../../../helper/snackbar.dart';
import '../../homepage/view/homepage.dart';

class LoginPageController extends GetxController {
  TextEditingController mobileNumberController = TextEditingController();
  final prefs = SPController();
  final auth = FirebaseAuth.instance;
  final users = FirebaseFirestore.instance.collection('users');

  //Otp Screen
  final _sendOtp = false.obs;
  bool get sendOtp => _sendOtp.value;
  late String _verificationId;
  onSendOtp() async {
    if (mobileNumberController.text.length != 10) {
      snackbar("Please enter a valid mobile number");
      return;
    }
    ;
    log("Sending Otp to: ${mobileNumberController.text}");
    _sendOtp(true);
    auth.verifyPhoneNumber(
      phoneNumber: "+91${mobileNumberController.text}",
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        print(e);
      },
      codeSent: (String verificationId, int? resendToken) {
        _verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  //Otp value
  final _otp = ''.obs;
  String get otp => _otp.value;
  onChangedOtp(String x) {
    _otp(x);
  }

  onLogin() async {
    LoadingUtils.showLoader();
    log("otp: $otp");
    try {
      var credential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: otp);
      log("verfication completed");
      var userCredential =
          await auth.signInWithCredential(credential).then((userCredential) {
        var uid = userCredential.user!.uid;
        prefs.setIsLoggedin(true);
        prefs.setUserId(uid);
        users.doc(uid).get().then((user) {
          LoadingUtils.hideLoader();
          if (user.exists) {
            HomePage.launch();
          }
          //  else {
          //   CreateProfile.launch();
          // }
        });
      });
    } catch (e) {
      LoadingUtils.hideLoader();
      snackbar(e.toString());
      _sendOtp(false);
    }
  }
}
