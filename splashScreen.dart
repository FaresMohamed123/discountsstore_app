// ignore_for_file: library_private_types_in_public_api, must_call_super, depend_on_referenced_packages, file_names

import 'dart:async';
import 'package:discountsstore_app/controller/auth/splashscreen_controller.dart';
import 'package:discountsstore_app/core/constant/imgaeasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

SplashScreenController controller = Get.put(SplashScreenController());
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () => controller.isregistered());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
    width: double.infinity,
      height: double.infinity,
        decoration: const BoxDecoration(
         
             
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 254, 3, 179),
                Color.fromARGB(255, 85, 81, 76),
              ]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(50),
                  ),
                  const CircleAvatar(
                    radius: 85,
                    backgroundImage: AssetImage(AppImageAsset.logo55),
                    // child: Image.asset(
                    //  AppImageAsset.SplashScreen,
                    //   height: 174.0,
                    //   width: double.infinity,
                    // ),
                  ),
                  const SizedBox(height: 20,),
                  const Text(
                    "Discounts Store",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                const Text(
                  'Special Discount For You',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                  ),
                ),
                ],
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  child: const Text(
                    'Version 1.1',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11.0,
                    ),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
