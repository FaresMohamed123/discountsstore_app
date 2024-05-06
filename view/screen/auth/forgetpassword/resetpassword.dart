// ignore_for_file: depend_on_referenced_packages, unused_import, deprecated_member_use

import 'package:discountsstore_app/core/functions/validinput.dart';

import '/controller/auth/forgetpassword_controller.dart';
import '/controller/auth/resetpassword_controller.dart';
import '/core/constant/routes.dart';

import '/core/constant/color.dart';
import '/view/widget/auth/custombuttonauth.dart';
import '/view/widget/auth/customtextbodyauth.dart';
import '/view/widget/auth/customtextformauth.dart';
import '/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassWord extends StatelessWidget {
  const ResetPassWord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResePasWordControllerImp controller =
        Get.put(ResePasWordControllerImp(), permanent: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('تغير كلمة السر',
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
            const CustomTextTitleAuth(text: "كلمة السر الجديدة"),
            const SizedBox(height: 10),
            const CustomTextBodyAuth(text: "الرجاء ادخال كلمة مرور جديدة"),
            const SizedBox(height: 15),
            CustomTextFormAuth(
              vaild: (val) {
                return validInput(val!, 5, 30, 'passwored');
              },
              mycontroller: controller.password,
              hinttext: "ادخل كلمة المرور",
              iconData: Icons.lock_outline,
              labeltext: "كلمة المرور",
              // mycontroller: ,
            ),
            CustomTextFormAuth(
              vaild: (val) {
                return validInput(val!, 5, 30, 'passwored');
              },
              mycontroller: controller.repassword,
              hinttext: "اعد ادخال كلمة المرور ",
              iconData: Icons.lock_outline,
              labeltext: "كلمة المرور",
              // mycontroller: ,
            ),
            CustomButtomAuth(
                text: "حفظ",
                onPressed: () {
                  controller.goToSuccessResetPassword();
                }),
            const SizedBox(height: 40),
          ]),
        ),
      ),
    );
  }
}
