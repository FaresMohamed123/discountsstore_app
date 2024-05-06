// ignore_for_file: depend_on_referenced_packages
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:discountsstore_app/infoWidget.dart';
import 'package:discountsstore_app/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:discountsstore_app/routes.dart';
import 'package:discountsstore_app/bindings/intialbindings.dart';
import 'package:discountsstore_app/core/localization/translation.dart';
import 'package:get/get.dart';
import 'core/localization/changelocal.dart';
import 'core/services/services.dart';
late SharedPreferences sharedPref;
void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
 sharedPref=await SharedPreferences.getInstance();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title:'Flutter Demo',
      locale: controller.language,
  theme: controller.appTheme, 
      initialBinding:InitialBindings() ,
      home: InfoWidget(
          builder: (context, deviceInfo) {
           return  const SplashScreen();
          },
         ),
      getPages: routes,
    );
  }
}
