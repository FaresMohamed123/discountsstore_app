// ignore_for_file: depend_on_referenced_packages, unused_import, deprecated_member_use

import 'package:discountsstore_app/core/functions/validinput.dart';

import '/controller/auth/forgetpassword_controller.dart';
import '/controller/auth/verifycode_controller.dart';
import '/controller/auth/signup_controller.dart';
import '/core/constant/color.dart';
import '/view/widget/auth/custombuttonauth.dart';
import '/view/widget/auth/customtextbodyauth.dart';
import '/view/widget/auth/customtextformauth.dart';
import '/view/widget/auth/customtexttitleauth.dart';
import '/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    ForgetPasswoedControllerImp controller =
        Get.put(ForgetPasswoedControllerImp(),permanent: true);
    VerifyCodePasWordControllerImp controller2 =
    Get.put(VerifyCodePasWordControllerImp(),permanent: true);
    return Scaffold(
      appBar: AppBar(
        actions: [ IconButton(
          icon:const Icon(Icons.highlight_remove_outlined,color: AppColor.primaryColor,size: 30),
          onPressed: () {
            Get.back();
          },
        ),],
     
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(' Forget Password',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: controller.formstate,
          child: ListView(children: [
            const SizedBox(height: 20),
            const CustomTextTitleAuth(text: "تاكد من البريد الالكترونى"),
            const SizedBox(height: 10),
            const CustomTextBodyAuth(
                text: "الرجاء ادخال عنوان بريدك الالكترونى لتلقى رمز التحقيق"),
            const SizedBox(height: 15),
          CustomTextFormAuth(
              vaild: (val) {
                return validInput(val!, 5, 100, 'email');
              },
              mycontroller: controller.email,
              hinttext: "ادخل البرريد الالكترونى",
              iconData: Icons.email_outlined,
              labeltext: " البرريد الالكترونى",
              // mycontroller: ,
            ),
            CustomButtomAuth(
                text: "تأكيد",
                onPressed: () {
                  controller2.email = controller.email.text ;
                  controller.goToVerfiycode();
                }),
            const SizedBox(height: 40),
          ]),
        ),
      ),
    );
  }
}
