// ignore_for_file: avoid_unnecessary_containers, depend_on_referenced_packages

import 'package:discountsstore_app/controller/onboarding_controller.dart';
import 'package:discountsstore_app/core/constant/color.dart';
import 'package:discountsstore_app/view/widget/onboarding/custombutton.dart';
import 'package:discountsstore_app/view/widget/onboarding/customslider.dart';
import 'package:discountsstore_app/view/widget/onboarding/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
        backgroundColor: AppColor.backgroundcolor,
        body: SafeArea(child: Column(children: [
      const Expanded(
        flex: 4,
        child: CustomSliderOnBoarding(),
      ),
      Expanded(
          flex: 1,
          child: Column(
            children:const  [
              CustomDotControllerOnBoarding(),
              Spacer(flex: 2),
              CustomButtonOnBoarding()
            ],
          ))
    ]),
        
      ));
  }
}
