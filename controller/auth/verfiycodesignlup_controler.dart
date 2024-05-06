// ignore_for_file: depend_on_referenced_packages, unused_import, unnecessary_overrides

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignleController extends GetxController {
  checkCode();
  goToSuccessSignUp();
}

class VerifyCodeSignleControllerImp extends VerifyCodeSignleController {
  late String verifycode;
  @override
  checkCode() {
  }
  @override
  goToSuccessSignUp() {
  }
  @override
  void onInit() {
    super.onInit();
  }
}
