// ignore_for_file: depend_on_referenced_packages, avoid_print, non_constant_identifier_names, unused_element

import 'package:discountsstore_app/core/class/crud.dart';
import 'package:discountsstore_app/core/class/statusrequest.dart';
import 'package:discountsstore_app/core/functions/handingdatacontroller.dart';
import 'package:discountsstore_app/core/services/services.dart';
import 'package:discountsstore_app/linkapi.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

Crud crud = Crud();

abstract class SearchController extends GetxController {
  Search();
  goToSearch();
}

class SearchControllerImp extends SearchController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  bool isloading = false;
  bool isshowpassword = true;
  

  @override
  Search() async {
    update();

    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      isloading = true;
      update();

      var response = await crud.postRequest(AppLink.search, {
  
      });
      isloading = false;
      statusRequest = StatusRequest.loading;
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        // if (response[0]['status'] == true) {
         
        // } 
    }
  }

  @override
  goToSearch() {

  }

  @override
  void onInit() {

    super.onInit();
    update();
  }

  @override
  void dispose() {
 
    super.dispose();
  }

  
}

  @override
  goToSearch() {
    throw UnimplementedError();
  }
}
