// ignore_for_file: depend_on_referenced_packages, avoid_print, non_constant_identifier_names
import 'package:get_storage/get_storage.dart';

import 'package:discountsstore_app/core/class/crud.dart';
import 'package:discountsstore_app/core/class/statusrequest.dart';
import 'package:discountsstore_app/core/constant/color.dart';
import 'package:discountsstore_app/core/constant/routes.dart';
import 'package:discountsstore_app/core/functions/handingdatacontroller.dart';
import 'package:discountsstore_app/linkapi.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

Crud _crud = Crud();

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  bool isloading = false;
  bool isshowpassword = true;
  showpassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  signUp() async {
    // var formdata = formstate.currentState;
    // if(!await crud.checkConnection()){
    //   Toast.show("not connected Internet", duration: Toast.lengthShort, gravity:  Toast.bottom);
    // }
    update();
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;

      isloading = true;
      var response = await _crud.postRequest(AppLink.linkSignup, {
        'username': username.text,
        'email': email.text,
        'phone': phone.text,
        'password': password.text,
      });
      print(response);
      final box = GetStorage();
      isloading = false;
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response[0]['status'] == true) {
          var User = response[0]['id'].toString();
          await box.write('isregister', true);
          await box.write('user', User);
          //postgetUserinfo(User);
          postgetUserinfo(box.read('user'));

          Get.offNamed(AppRoute.homepage);
        } else {
          print(response);
          Get.snackbar('', 'هذا الحساب مستخدم بالفعل',
              backgroundColor: AppColor.primaryColor,
              colorText: AppColor.backgroundcolor);
        }
        update();
      } else {
        // ignore:
        print('Not Valid');
        Get.snackbar('', 'خطأ في اسم المستخدم او كلمة السر',
            backgroundColor: AppColor.primaryColor,
            colorText: AppColor.backgroundcolor);
      }
    }
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
