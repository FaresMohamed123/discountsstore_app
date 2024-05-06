// ignore_for_file: avoid_unnecessary_containers, depend_on_referenced_packages, must_be_immutable, unused_local_variable, invalid_use_of_protected_member, avoid_print, body_might_complete_normally_nullable

import 'package:discountsstore_app/controller/auth/login_controller.dart';
import 'package:discountsstore_app/controller/home_controller.dart';
import 'package:discountsstore_app/core/class/crud.dart';
import 'package:discountsstore_app/core/constant/color.dart';
import 'package:discountsstore_app/core/constant/imgaeasset.dart';
import 'package:discountsstore_app/dat.dart';
import 'package:discountsstore_app/linkapi.dart';
import 'package:discountsstore_app/view/widget/home/customDrawer.dart';
import 'package:discountsstore_app/view/widget/home/customappbar.dart';
import 'package:discountsstore_app/view/widget/home/customcardhome.dart';
import 'package:discountsstore_app/view/widget/home/customtitlehome.dart';
import 'package:discountsstore_app/view/widget/home/listcategorieshome.dart';
import 'package:discountsstore_app/view/widget/home/listitemshome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

Crud crud = Crud();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatController datController = Get.put(DatController());

  LoginController loginController = Get.put(LoginControllerImp());


  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());

    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: AppColor.black,
      appBar: AppBar(
        backgroundColor: AppColor.black,
        elevation: 0,
        actions: [
          const SizedBox(width: 50),
          const SizedBox(width: 10),
          Expanded(
              child: Container(
            decoration: const BoxDecoration(),
            child: const Text(
              'DiscountsStore',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: AppColor.primaryColor,
                fontStyle: FontStyle.italic,
              ),
            ),
          )),
          MaterialButton(
            onPressed: () {
              Get.defaultDialog(
                  title: 'Id',
                  titleStyle: const TextStyle(
                      color: AppColor.primary2,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                  middleText: '# $usercopon#',
                  middleTextStyle: const TextStyle(
                    color: AppColor.backgroundcolor,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: AppColor.secondColor,
                  // actions: [
                  //   ClipRRect(
                  //       borderRadius: BorderRadius.circular(22),
                  //       child: Image.asset('assets/images/cuar.jpg'))
                  // ]
                  );
            },
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              width: 60,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    AppImageAsset.logo55,
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: Obx(
      () => datController.loading.value
          ?Center(
            child: Lottie.asset(AppImageAsset.loading, width: 250, height: 250))
          :   Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
                CustomSearch(
                titleappbar: "Find Product",
                onPressedSearch: () {}),
                const CustomCardHome(
                title: "A summer surprise", body: "Save Money 20%"),
                const CustomTitleHome(title: "Other Products"),
                const SizedBox(height: 10),
                const ListCategoriesHome(),
                const SizedBox(height: 10),
                const CustomTitleHome(title: "Product for you"),
                const SizedBox(height: 10),
                const ListItemsHome(),               
                const SizedBox(height: 20),
                //const ListItemsHome()
              ],
            )),
      ),
    );
  }
}
