// ignore_for_file: depend_on_referenced_packages, unused_import, unused_local_variable, deprecated_member_use

import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '/controller/auth/forgetpassword_controller.dart';
import '/controller/auth/verfiycodesignlup_controler.dart';
import '/controller/auth/verifycode_controller.dart';
import '/core/constant/routes.dart';

import '/core/constant/color.dart';
import '/view/widget/auth/custombuttonauth.dart';
import '/view/widget/auth/customtextbodyauth.dart';

import '/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerfiyCodeSignlUp extends StatelessWidget {
  const VerfiyCodeSignlUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   VerifyCodeSignleControllerImp controller =
        Get.put(VerifyCodeSignleControllerImp());
    return Scaffold(
      appBar: AppBar(
         leading: IconButton(
          icon:const Icon(Icons.highlight_remove_outlined,color: AppColor.primaryColor,size: 30),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('Verification Code',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(children: [
          const SizedBox(height: 20),
          const CustomTextTitleAuth(text: "تأكد من الكود"),
          const SizedBox(height: 10),
          const CustomTextBodyAuth(text: "الرجاءادخال رمز الرقم المرسل اليك"),
          const SizedBox(height: 15),
          OtpTextField(
            textStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            fieldWidth: 50,
            borderRadius: BorderRadius.circular(20),
            numberOfFields: 5,
            borderColor: AppColor.primaryColor,
            showFieldAsBox: true,
            onCodeChanged: (String code) {},
            onSubmit: (String verificationCode) {
              // controller.goToSuccessSignUp();
                 Get.toNamed(AppRoute.successSignUp);

            }, // end onSubmit
          ),
         
        ]),
      ),
    );
  }
}
