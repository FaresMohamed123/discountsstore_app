// ignore_for_file: deprecated_member_use, non_constant_identifier_names, avoid_print, invalid_use_of_protected_member, must_call_super, await_only_futures, unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:discountsstore_app/core/constant/color.dart';
import 'package:discountsstore_app/linkapi.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
class DatController extends GetxController {
  RxList categoryList = [].obs;
 
  RxBool loading = false.obs;
  RxBool loading2 = false.obs;
  RxList category = [].obs;

  var api1 = AppLink.posts;
  var category1 = AppLink.category;

  Future getAllCategories() async {
    loading2.value = true;
    var categoryurl = await Uri.parse(category1);
    var response1 = await http.get(categoryurl);
    print(response1);
    var responsebody1 = await jsonDecode(response1.body);
    print(responsebody1);
    category.value = await responsebody1;
    loading2.value = false;
  }

  Future getdata() async {
    loading.value = true;
    var categoryurl = await Uri.parse(api1);
    var response1 = await http.get(categoryurl);
    print(response1);
    var responsebody1 = await jsonDecode(response1.body);
    print(responsebody1);
    categoryList.value = await responsebody1;
    loading.value = false;
  }

  Future getdatat(category) async {
    loading.value = true;
    var categoryurl = await crud.postRequest(AppLink.filtercategory, {
      'category': category,
    });
    print('####${categoryurl}');
    categoryList.value = await categoryurl;
    loading.value = false;
  }

  findByCopon(String copon_id) async {
    var response = await crud.postRequest(AppLink.copon, {
      'id': copon_id,
    });
    if (response == 'yes') {
      Get.snackbar(
'موجود ','موجود موجود',
        backgroundColor: AppColor.primary2,
      );
    } else {
      Get.snackbar('غير', 'غير غير', backgroundColor: AppColor.primary2);
    }
  
  }

  addsearch(String key) async {
    var response = await crud.postRequest(AppLink.search, {
      'key': key,
    });
    categoryList.value = await response;
    print(key);
  }

  @override
  void onInit() {
    getdata();
    getAllCategories();
    update();
  }

  void OnPressedUrl(String uri) async {
    await launch(uri);
  }

}
