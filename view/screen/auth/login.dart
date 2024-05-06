// ignore_for_file: deprecated_member_use, depend_on_referenced_packages, unused_local_variable, unused_element, dead_code

import 'dart:ui';

import 'package:discountsstore_app/controller/auth/login_controller.dart';
import 'package:discountsstore_app/core/class/handlingdataview.dart';
import 'package:discountsstore_app/core/constant/color.dart';
import 'package:discountsstore_app/core/functions/validinput.dart';
import 'package:discountsstore_app/view/widget/auth/custombuttonauth.dart';
import 'package:discountsstore_app/view/widget/auth/customtextbodyauth.dart';
import 'package:discountsstore_app/view/widget/auth/customtextformauth.dart';
import 'package:discountsstore_app/view/widget/auth/customtexttitleauth.dart';
import 'package:discountsstore_app/view/widget/auth/logoauth.dart';
import 'package:discountsstore_app/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    late RiveAnimationController btnAnimationController;

    bool isShowSignInDialog = false;

    @override
    void initState() {
      btnAnimationController = OneShotAnimation(
        "active",
        autoplay: false,
      );
      super.initState();
    }

    Get.put(LoginControllerImp());
    return Scaffold(
        body: GetBuilder<LoginControllerImp>(
            builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: controller.isloading == true
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Stack(children: [
                        Positioned(
                          width: MediaQuery.of(context).size.width * 1.7,
                          left: 100,
                          bottom: 100,
                          child: Image.asset(
                            "assets/Backgrounds/Spline.png",
                          ),
                        ),
                        Positioned.fill(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                            child: const SizedBox(),
                          ),
                        ),
                        const RiveAnimation.asset(
                          "assets/RiveAssets/shapes.riv",
                        ),
                        Positioned.fill(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                            child: const SizedBox(),
                          ),
                        ),
                      Center(
                            child: Container(
                             // color: const Color(0xffFEEAE6),
                              margin: const EdgeInsets.all(0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 30),
                                      child: Form(
                                        key: controller.formstate,
                                        child: ListView(children: [
                                          const LogoAuth(),
                                          const SizedBox(height: 10),
                                          const CustomTextTitleAuth(text: "اهلا بكم"),
                                          const SizedBox(height: 10),
                                          const CustomTextBodyAuth(text:"قم بعملية تسجيل الدخول الخاص بيك"),
                                          const SizedBox(height: 15),
                                          CustomTextFormAuth(vaild: (val) {return validInput(val!, 5, 100, 'email');},
                                            mycontroller: controller.email,
                                            hinttext: "12".tr,
                                            iconData: Icons.email_outlined,
                                            labeltext: "18".tr,
                                            // mycontroller: ,
                                          ),
                                          GetBuilder<LoginControllerImp>(
                                            builder: (controller) =>
                                              CustomTextFormAuth(
                                              obscureText:controller.isshowpassword,
                                              onTapIcon: () {
                                              controller.showpassword();
                                              },
                                              vaild: (val) {
                                                return validInput(
                                                   val!, 5, 30, 'password');
                                              },
                                              mycontroller: controller.password,
                                              hinttext:"13".tr,
                                              iconData: Icons.lock_outline,
                                              labeltext: "19".tr,
                                              // mycontroller: ,
                                            ),
                                          ),
                                        
                                          InkWell(
                                            onTap: () {
                                              controller.goToForgetPassword();
                                            },
                                            child:  Text(
                                              '14'.tr,
                                              style: const TextStyle(
                                                  color: AppColor.primaryColor),
                                              textAlign: TextAlign.end,
                                            ),
                                          ),
                                          CustomButtomAuth(
                                             text: "15".tr,
                                              onPressed: () {
                                                controller.login();
                                              }),
                                          const SizedBox(height: 40),
                                          CustomTextSignUpOrSignIn(
                                             textone: "25".tr,
                                               texttwo: "26".tr,
                                            onTap: () {
                                              controller.goToSignUp();
                                            },
                                          )
                                        ]),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                       
                      ],),),),
    
        );
  }
}
