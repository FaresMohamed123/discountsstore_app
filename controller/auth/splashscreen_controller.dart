import 'package:discountsstore_app/core/constant/routes.dart';
import 'package:discountsstore_app/linkapi.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class SplashScreenController extends GetxController {
  final box = GetStorage();

  void isregistered() async {
    if (box.read('isregister') == true) {
      await postgetUserinfo(box.read('user'));
      Get.offAllNamed(AppRoute.homepage);
    } else {
            Get.offAllNamed(AppRoute.language);
    }
  }
}
