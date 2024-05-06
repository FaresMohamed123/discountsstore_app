import 'package:discountsstore_app/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController {
  gotoPageLagin();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  gotoPageLagin() {
    Get.offAllNamed(AppRoute.login);
  }
}
