// ignore_for_file: depend_on_referenced_packages, avoid_print, non_constant_identifier_names

import 'package:discountsstore_app/core/class/crud.dart';
import 'package:discountsstore_app/core/class/statusrequest.dart';
import 'package:discountsstore_app/core/constant/color.dart';
import 'package:discountsstore_app/core/constant/routes.dart';
import 'package:discountsstore_app/core/functions/handingdatacontroller.dart';
import 'package:discountsstore_app/core/services/services.dart';
import 'package:discountsstore_app/linkapi.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

Crud crud = Crud();

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  late TextEditingController email;
  late TextEditingController password;
  bool isloading = false;
  bool isshowpassword = true;
  showpassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  login() async {
    update();

    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      isloading = true;
      update();

      var response = await crud.postRequest(AppLink.linkLogin, {
        'email': email.text,
        'password': password.text,
      });
      final box = GetStorage();
      isloading = false;
      statusRequest = StatusRequest.loading;
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response[0]['status'] == true) {
          var User = response[0]['id'].toString();
          await box.write('isregister', true);
          await box.write('user', User);
          postgetUserinfo(box.read('user'));
          Get.offAllNamed(AppRoute.homepage);
        } else {
          Get.snackbar('', response[0]['error'],
              backgroundColor: AppColor.primaryColor,
              colorText: AppColor.backgroundcolor);
        }
        update();
      } else {
        // ignore:
        Get.snackbar('خطأ في اسم المستخدم او كلمة السر', '',
            backgroundColor: AppColor.primaryColor,
            colorText: AppColor.backgroundcolor);
      }
    }
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
    update();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forGetPassword);
  }
}
