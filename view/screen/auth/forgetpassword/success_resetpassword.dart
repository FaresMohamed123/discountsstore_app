// ignore_for_file: depend_on_referenced_packages, sized_box_for_whitespace, unused_import, unused_local_variable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/core/constant/color.dart';
import '/core/constant/routes.dart';
import '/view/widget/auth/custombuttonauth.dart';

import '../../../../controller/auth/SuccessResetPassword_controller.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller =
        Get.put(SuccessResetPasswordControllerImp());
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
                text: "الذهاب الى التسجيل",
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
