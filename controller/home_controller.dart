// ignore_for_file: avoid_print

import '/core/class/statusrequest.dart';
import '/core/services/services.dart';
import '/data/datasource/remote/home_data.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  initialData();
 getdata();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  String? username;
  String? id;
  HomeData homedata = HomeData(Get.find());
  List categories = [];
  List items = [];
  late StatusRequest statusRequest;
  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    getdata();
    initialData();
    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
  
    if (StatusRequest.success == statusRequest) {
   
    }
    update();
  }
}
