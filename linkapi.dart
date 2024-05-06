// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables, unused_element

import 'package:discountsstore_app/core/class/crud.dart';
import 'package:get/get.dart';

class AppLink {
//
  static const String linkUserinfo = 'https://dis-store.website';
  static const String linkServerName = 'https://dis-store.website';
  static const String linkSignup = '$linkServerName/auth/signup/';
  static const String linkLogin = '$linkServerName/auth/login/';
  static const String category = '$linkServerName/category/';
  static const String posts = '$linkServerName/posts/';
  static const String search = '$linkServerName/posts/';
  static const String copon = '$linkServerName/copon/';
  static const String filtercategory = '$linkServerName/posts/';
}

Crud crud = Crud();

List linkApi = [];
RxList data = [].obs;
RxList msgs = [].obs;
var userid;
var usercopon;
postgetUserinfo(String userId) async {
  linkApi = [];
  data.value = [];
  var response = await crud.postRequest(AppLink.linkUserinfo, {
    'id': userId,
  });
  userid = userId;
  if (response != false) {
    linkApi.add(response);
    data.add(response);
    usercopon = response['user_copon'];
    print(response);
  } else {
    data.add(response);
  }
  app() async {
    var r = await crud.getRequest(AppLink.posts);
    msgs.add(r[0]['text']);
    // }
    print('-----------${r[0]['text']}');
  }
}
