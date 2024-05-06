// ignore_for_file: depend_on_referenced_packages, sized_box_for_whitespace, unused_import

import 'package:discountsstore_app/controller/onboarding_controller.dart';
import 'package:discountsstore_app/core/constant/color.dart';
import 'package:discountsstore_app/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
              const SizedBox(height:80),
                Container(
                  height: 300,
                  width: 300,
                  child: Image.asset(
                    onBoardingList[i].image!,
                    // width: ,
                    height: Get.width / 1.0,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(height: 20),
                
                // Text(onBoardingList[i].title!,
                //     style: const TextStyle(
                //         fontWeight: FontWeight.bold,
                //         fontSize: 22,
                //         color: AppColor.black)),
                const SizedBox(height: 20),
                // Container(
                //     width: double.infinity,
                //     alignment: Alignment.center,
                //     child: Text(
                //       onBoardingList[i].body!,
                //       textAlign: TextAlign.center,
                //       style: const TextStyle(
                //           height: 2,
                //           color: AppColor.grey,
                //           fontWeight: FontWeight.bold,
                //           fontSize: 14),
                //     )),
              ],
            ));
  }
}


