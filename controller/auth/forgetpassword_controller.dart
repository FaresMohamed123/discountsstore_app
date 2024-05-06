// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:discountsstore_app/core/class/crud.dart';
import 'package:discountsstore_app/core/constant/color.dart';
import 'package:discountsstore_app/core/constant/routes.dart';
import 'package:discountsstore_app/linkapi.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
Crud crud = Crud();
abstract class ForgetPasswoedController extends GetxController {
  checkemail();
  goToVerfiycode();
}

class ForgetPasswoedControllerImp extends ForgetPasswoedController {
    GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  
  @override
  checkemail() {
   
  }

  @override
  goToVerfiycode() async{
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      var response = await crud.postRequest(AppLink.linkServerName, {
        'email': email.text,
      });
      if (response == 'Code has been sent successfully'){
        Get.offNamed(AppRoute.verfiyCode);
         print('Valid');
      } else {
         print('Not Valid');
        Get.snackbar('الايميل غير مسجل في موقعنا', '',backgroundColor: AppColor.primaryColor,colorText: AppColor.backgroundcolor);
      }
      print('Valid');
      } else {
       Get.snackbar('الايميل غير مسجل في موقعنا', '',backgroundColor: AppColor.primaryColor,colorText: AppColor.backgroundcolor);
       print('Not Valid');
     }
   }

  @override
  void onInit() {
  
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
 
    email.dispose();
   
    super.dispose();
  }
}