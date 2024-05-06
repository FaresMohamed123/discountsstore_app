// ignore_for_file: depend_on_referenced_packages, unused_import, unnecessary_overrides, avoid_print


import 'package:discountsstore_app/controller/auth/forgetpassword_controller.dart';
import 'package:discountsstore_app/controller/auth/resetpassword_controller.dart';
import 'package:discountsstore_app/core/class/crud.dart';
import 'package:discountsstore_app/core/constant/color.dart';
import 'package:discountsstore_app/core/constant/routes.dart';
import 'package:discountsstore_app/linkapi.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


Crud crud = Crud();
ResePasWordControllerImp controller2 =
    Get.put(ResePasWordControllerImp(), permanent: true);
ForgetPasswoedControllerImp controller =
    Get.put(ForgetPasswoedControllerImp(), permanent: true);

abstract class VerifyCodePasWordController extends GetxController {
  checkCode();
  goToResetPassword();
}

class VerifyCodePasWordControllerImp extends VerifyCodePasWordController {
  // ignore: prefer_typing_uninitialized_variables
  var email, verifycode;

  @override
  checkCode() {}

  @override
  goToResetPassword() async {
    var response = await crud.postRequest(AppLink.linkServerName, {
      'email': email,
      'code': verifycode,
    });
    // print(response);
    // print(email);
    // print(verifycode);

    if (response['correct_code'] == true) {
      controller2.email = email;
      Get.offNamed(AppRoute.resetPassword);
      print('value');
    } else {
      Get.snackbar('الرقم خاطئ', 'يكتب الكود من اليمين الى الشمال',
          backgroundColor: AppColor.primaryColor,
          colorText: AppColor.backgroundcolor);
          print('not  value');
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
