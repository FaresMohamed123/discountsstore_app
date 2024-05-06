// ignore_for_file: depend_on_referenced_packages, unused_import, avoid_print

import 'package:discountsstore_app/core/class/crud.dart';
import 'package:discountsstore_app/core/constant/color.dart';
import 'package:discountsstore_app/core/constant/routes.dart';
import 'package:discountsstore_app/linkapi.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

Crud crud = Crud();

abstract class ResePasWordController extends GetxController {
  resetPassWord();
  goToSuccessResetPassword();
}

class ResePasWordControllerImp extends ResePasWordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final TextEditingController password = TextEditingController();
  final TextEditingController repassword = TextEditingController();
  // ignore: prefer_typing_uninitialized_variables
  var email;
  @override
  resetPassWord() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
     
      print('Valid');
    } else {   print('Not Valid');
    }
  }

  @override
  goToSuccessResetPassword() async {
    var response = await crud.postRequest(AppLink.linkServerName, {
      'email': email,
      'password1': password.text,
      'password2': repassword.text,
    });
    print(response);

    if (response['logged'] == true) {
    Get.offNamed(AppRoute.successResetPassword);
        print('value');
    } else {
        print('not value');
      Get.snackbar('حصلت مشكلة', '',
          backgroundColor: AppColor.primaryColor,
          colorText: AppColor.backgroundcolor);
    }
  }

  @override
  void dispose() {
    password.dispose();

    super.dispose();
  }
}
