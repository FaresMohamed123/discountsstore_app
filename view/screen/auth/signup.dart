// ignore_for_file: deprecated_member_use, depend_on_referenced_packages, unused_field, unused_import

import 'dart:ui';

import 'package:discountsstore_app/controller/auth/signup_controller.dart';
import 'package:discountsstore_app/core/class/handlingdataview.dart';
import 'package:discountsstore_app/core/class/statusrequest.dart';
import 'package:discountsstore_app/core/constant/color.dart';
import 'package:discountsstore_app/core/constant/imgaeasset.dart';
import 'package:discountsstore_app/core/functions/alertexitapp.dart';
import 'package:discountsstore_app/core/functions/validinput.dart';
import 'package:discountsstore_app/view/widget/auth/custombuttonauth.dart';
import 'package:discountsstore_app/view/widget/auth/customtextbodyauth.dart';
import 'package:discountsstore_app/view/widget/auth/customtextformauth.dart';
import 'package:discountsstore_app/view/widget/auth/customtexttitleauth.dart';
import 'package:discountsstore_app/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
late RiveAnimationController _btnAnimationController;
  bool isShowSignInDialog = false;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
        body:GetBuilder<SignUpControllerImp>(
            builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: controller.isloading == true
                    ? const Center(
                        child: CircularProgressIndicator(),
                      ) : Stack(
        children: [
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
         SafeArea(
              child: Padding(
                //32
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
 Expanded(
   child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Stack(
                children: [
                  Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 30),
                                child: Form(
                                  key: controller.formstate,
                                  child: ListView(children: [
                                    const SizedBox(height: 20),
                                    CustomTextTitleAuth(text: "10".tr),
                                    const SizedBox(height: 10),
                                    CustomTextBodyAuth(text: "24".tr),
                                    const SizedBox(height: 15),
                                    CustomTextFormAuth(
                                     // isNumber: false,
                                      vaild: (val) {
                                        return validInput(
                                            val!, 3, 20, "username");
                                      },
                                      mycontroller: controller.username,
                                      hinttext: "23".tr,
                                      iconData: Icons.person_outline,
                                      labeltext: "20".tr,
                                      // mycontroller: ,
                                    ),
                                    CustomTextFormAuth(
                                     // isNumber: false,
                                      vaild: (val) {
                                        return validInput(val!, 3, 40, "email");
                                      },
                                      mycontroller: controller.email,
                                      hinttext: "12".tr,
                                      iconData: Icons.email_outlined,
                                      labeltext: "18".tr,
                                      // mycontroller: ,
                                    ),
                                    CustomTextFormAuth(
                                     // isNumber: true,
                                      vaild: (val) {
                                        return validInput(val!, 7, 11, "phone");
                                      },
                                      mycontroller: controller.phone,
                                      hinttext: "22".tr,
                                      iconData: Icons.phone_android_outlined,
                                      labeltext: "21".tr,
                                      // mycontroller: ,
                                    ),
                                
                                    GetBuilder<SignUpControllerImp>(builder: (controller)=> CustomTextFormAuth(
                              obscureText: controller.isshowpassword,
                              onTapIcon: () {
                                controller.showpassword();
                              },
                              vaild: (val) {
                                return validInput(val!, 5, 30, 'password');
                              },
                              mycontroller: controller.password,
                              hinttext: "13".tr,
                              iconData: Icons.lock_outline,
                              labeltext:  "19".tr,
                              // mycontroller: ,
                            ),),
                           
                                    CustomButtomAuth(
                                        text: "17".tr,
                                        onPressed: () {
                                          controller.signUp();
                                        }),
                                    const SizedBox(height: 40),
                                    CustomTextSignUpOrSignIn(
                                      textone: "25".tr,
                                      texttwo: "26".tr,
                                      onTap: () {
                                        controller.goToSignIn();
                                      },
                                    ),
                                  ]),
                                ),
                              ),
                     
                ],
              ),
            ),
 
                   ),
                  ],
                ),
              ),
            ),
         
        ],
      ),
            ))
    );
  }
}


//  body: Padding(
//         padding: const EdgeInsets.only(top: 20),
//         child: Container(
//           decoration: BoxDecoration(
//             color: AppColor.black.withOpacity(0.8),
//             image: const DecorationImage(
//                 fit: BoxFit.cover,
//                 image: AssetImage(
//                   AppImageAsset.background3,
//                 )),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.only(top: 40),
//             child: Stack(
//               children: [
//                 WillPopScope(
//                     onWillPop: alertExitApp,
//                     child: GetBuilder<SignUpControllerImp>(
//                       builder: (controller) => controller.statusRequest ==
//                               StatusRequest.loading
//                           ? const Center(
//                               child: Text("Loading ..."),
//                             )
//                           : Container(
//                               padding: const EdgeInsets.symmetric(
//                                   vertical: 15, horizontal: 30),
//                               child: Form(
//                                 key: controller.formstate,
//                                 child: ListView(children: [
//                                   const SizedBox(height: 20),
//                                   CustomTextTitleAuth(text: "10".tr),
//                                   const SizedBox(height: 10),
//                                   CustomTextBodyAuth(text: "24".tr),
//                                   const SizedBox(height: 15),
//                                   CustomTextFormAuth(
//                                     isNumber: false,
//                                     valid: (val) {
//                                       return validInput(
//                                           val!, 3, 20, "username");
//                                     },
//                                     mycontroller: controller.username,
//                                     hinttext: "23".tr,
//                                     iconData: Icons.person_outline,
//                                     labeltext: "20".tr,
//                                     // mycontroller: ,
//                                   ),
//                                   CustomTextFormAuth(
//                                     isNumber: false,

//                                     valid: (val) {
//                                       return validInput(val!, 3, 40, "email");
//                                     },
//                                     mycontroller: controller.email,
//                                     hinttext: "12".tr,
//                                     iconData: Icons.email_outlined,
//                                     labeltext: "18".tr,
//                                     // mycontroller: ,
//                                   ),
//                                   CustomTextFormAuth(
//                                     isNumber: true,
//                                     valid: (val) {
//                                       return validInput(val!, 7, 11, "phone");
//                                     },
//                                     mycontroller: controller.phone,
//                                     hinttext: "22".tr,
//                                     iconData: Icons.phone_android_outlined,
//                                     labeltext: "21".tr,
//                                     // mycontroller: ,
//                                   ),
//                                   CustomTextFormAuth(
//                                     isNumber: false,

//                                     valid: (val) {
//                                       return validInput(
//                                           val!, 3, 30, "password");
//                                     },
//                                     mycontroller: controller.password,
//                                     hinttext: "13".tr,
//                                     iconData: Icons.lock_outline,
//                                     labeltext: "19".tr,
//                                     // mycontroller: ,
//                                   ),
//                                   CustomButtomAuth(
//                                       text: "17".tr,
//                                       onPressed: () {
//                                         controller.signUp();
//                                       }),
//                                   const SizedBox(height: 40),
//                                   CustomTextSignUpOrSignIn(
//                                     textone: "25".tr,
//                                     texttwo: "26".tr,
//                                     onTap: () {
//                                       controller.goToSignIn();
//                                     },
//                                   ),
//                                 ]),
//                               ),
//                             ),
//                     )),
//               ],
//             ),
//           ),
//         ),
//       ),


// import '/controller/auth/signup_controller.dart';
// import '/core/class/handlingdataview.dart'; 
// import '/core/constant/color.dart';
// import '/core/functions/alertexitapp.dart';
// import '/core/functions/validinput.dart';
// import '/view/widget/auth/custombuttonauth.dart';
// import '/view/widget/auth/customtextbodyauth.dart';
// import '/view/widget/auth/customtextformauth.dart';
// import '/view/widget/auth/customtexttitleauth.dart';
// import '/view/widget/auth/textsignup.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//    SignUpControllerImp controller = Get.put(SignUpControllerImp());

// class SignUp extends StatefulWidget {
//   const SignUp({Key? key}) : super(key: key);

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
  

//   @override
//   Widget build(BuildContext context) {
//     SignUpControllerImp controller = Get.put(SignUpControllerImp());
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: const Color(0xffFEEAE6),
//         elevation: 0.0,
//       ),
//       body:GetBuilder<SignUpControllerImp>(
//             builder: (controller) => HandlingDataRequest(
//                 statusRequest: controller.statusRequest,
//                 widget: controller.isloading == true 
//           ? const Center(
//               child: CircularProgressIndicator(),
//             )
//           : Center(
//             child: Container(
//               child: Row(
//                 children: [
//                   Expanded(
//                     flex: 7,
//                     child: Container(
//                       color: const Color(0xffFEEAE6),
//                         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//                         child: Form(
//                           key: controller.formstate,
//                           child: ListView(children: [
//                             const SizedBox(height: 20),
//                             const CustomTextTitleAuth(text: "اهلا بيك"),
//                             const SizedBox(height: 10),
//                             const CustomTextBodyAuth(
//                                 text: "كم بتسجيل البيانات الاتية لتكن معنا "),
//                             const SizedBox(height: 15),
//                             CustomTextFormAuth(
//                               vaild: (val) {
//                                 return validInput(val!, 8, 30, 'username');
//                               },
//                               mycontroller: controller.username,
//                               hinttext: "ادخل اسم",
//                               iconData: Icons.person_outline,
//                               labeltext: "الاسم",
//                               // mycontroller: ,
//                             ),
//                             CustomTextFormAuth(
//                               vaild: (val) {
//                                 return validInput(val!, 5, 100, 'email');
//                               },
//                               mycontroller: controller.email,
//                               hinttext: "ادخل البريد الالكترونى",
//                               iconData: Icons.email_outlined,
//                               labeltext: " البريد الالكترونى ",
//                               // mycontroller: ,
//                             ),
//                             CustomTextFormAuth(
//                               vaild: (val) {
//                                 return validInput(val!, 11, 12, 'phone');
//                               },
//                               mycontroller: controller.phone,
//                               hinttext: "ادخل رقم الموبيل",
//                               iconData: Icons.phone_android_outlined,
//                               labeltext: "الموبيل",
//                               // mycontroller: ,
//                             ),
//                             GetBuilder<SignUpControllerImp>(builder: (controller)=> CustomTextFormAuth(
//                               obscureText: controller.isshowpassword,
//                               onTapIcon: () {
//                                 controller.showpassword();
//                               },
//                               vaild: (val) {
//                                 return validInput(val!, 5, 30, 'password');
//                               },
//                               mycontroller: controller.password,
//                               hinttext: "ادخل  كلمة المرور",
//                               iconData: Icons.lock_outline,
//                               labeltext: " كلمةالمرور ",
//                               // mycontroller: ,
//                             ),),
                         
//                             CustomButtomAuth(
//                                 text: "تسجيل الدخول",
//                                 onPressed: () {
//                                   controller.signUp();
//                                 }),
//                             const SizedBox(height: 40),
//                             CustomTextSignUpOrSignIn(
//                               textone: "هل لديك حساب  ? ",
//                               texttwo: " SignIn ",
//                               onTap: () {
//                                 controller.goToSignIn();
//                               },
//                             ),
//                           ]),
//                         ),
//                       ),
//                   ),
                    
                    
//                 ],
//               ),
//             ),
//           ),),),
//     );
//   }
// }