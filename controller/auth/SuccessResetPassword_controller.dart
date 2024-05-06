// ignore_for_file: file_names, unused_import

import 'package:discountsstore_app/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController {
  gotoPageLagin();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  gotoPageLagin() {
    Get.offAllNamed(AppRoute.login);
  }
}
