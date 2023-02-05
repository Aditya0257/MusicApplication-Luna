import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luna/utils/colors.dart';
import 'package:luna/utils/dimensions.dart';
import 'package:luna/widgets/big_text.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../widgets/button.dart';
import '../../../../widgets/text_field.dart';
import '../controller/logincontroller.dart';

class LoginPage extends GetView<LoginPageController> {
  static const route = '/login';
  static launch() => Get.toNamed(route);
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/music_app_bckgrnd_img.png'),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(Dimensions.width20, Dimensions.height40,
              Dimensions.width20, Dimensions.height40),
          child: Column(children: [
            Expanded(
              flex: 1,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: BigText(
                    text: 'HEY YA!',
                    color: AppColors.white,
                  )),
            ),
            Expanded(
              flex: 3,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset('assets/images/headphone_logo.png')),
            ),
            const Expanded(flex: 4, child: SizedBox(),),
            Obx(() => controller.sendOtp
                ? Expanded(
                  flex: 4,
                    child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: Dimensions.height20,
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                controller.onSendOtp();
                              },
                              child: Container(
                                width: Dimensions.width40 * 8,
                                height: Dimensions.height20 * 2.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius20),
                                    border: Border.all(
                                        color: AppColors.pink, width: 2)),
                                child: Center(
                                  child: Text(
                                      controller.mobileNumberController.text),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.height20,
                          ),
                          BigText(
                            text: 'Enter Otp',
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: Dimensions.height20,
                          ),
                          SizedBox(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.width40),
                              child: PinCodeTextField(
                                  pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.box,
                                    borderRadius: BorderRadius.circular(15),
                                    activeColor: AppColors.dimWhite,
                                    inactiveColor: AppColors.dimWhite,
                                    selectedColor: AppColors.dimWhite,
                                  ),
                                  appContext: context,
                                  length: 6,
                                  onChanged: (value) {
                                    controller.onChangedOtp(value);
                                  }),
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.height20,
                          ),
                          BigText(text: 'By clicking Login, you accept our'),
                          BigText(
                            text: 'Terms and Conditions',
                            color: Colors.blueAccent,
                          ),
                          SizedBox(
                            height: Dimensions.height20,
                          ),
                          Button(
                            width: double.maxFinite,
                            height: Dimensions.height40 * 1.5,
                            radius: Dimensions.radius20 * 2,
                            on_pressed: () {
                              controller.onLogin();
                            },
                            text: 'LogIn',
                            color: AppColors.dimWhite,
                          ),
                        ],
                      ),
                    ),
                  ))
                : Expanded(
                  flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Center(
                          child: Text_Field(
                            
                            
                              radius: Dimensions.radius20,
                              text_field_width: double.maxFinite,
                              text_field_height: Dimensions.height20 * 3,
                              text_field: TextField(
                                
                                controller: controller.mobileNumberController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.phone,
                                    color: AppColors.dimWhite,
                                  ),
                                  hintText: 'Mobile Number',
                                ),
                              )),
                        ),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        Button(
                          textColor: AppColors.black,
                          width: Dimensions.width40*6,
                          height: Dimensions.height40 * 1.5,
                          radius: Dimensions.radius20 * 2,
                          on_pressed: () {
                            controller.onSendOtp();
                          },
                          text: 'Send Otp',
                          color: AppColors.dimWhite,
                        ),
                      ],
                    ),
                  ))
          ]),
        ),
      ),
    );
  }
}
