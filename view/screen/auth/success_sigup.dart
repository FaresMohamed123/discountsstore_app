// ignore_for_file: depend_on_referenced_packages, sized_box_for_whitespace, deprecated_member_use

import 'package:discountsstore_app/controller/auth/successsignup_controller.dart';
import 'package:discountsstore_app/core/constant/color.dart';
import 'package:discountsstore_app/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';




class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('Success',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          const Center(
            child: Icon(
              Icons.check_circle_outline,
              size: 200,
              color: AppColor.primaryColor,
            ),
          ),
          const Text('تمت العملية بنجاح'),
          const Text('.....'),
          const Spacer(),
          Container(
            width: double.infinity,
            child: CustomButtomAuth(
                text: "Sign Up",
                onPressed: () {
                  controller.gotoPageLagin();
                }),
          ),
          const SizedBox(
            height: 30,
          )
        ]),
      ),
    );
  }
}
