// ignore_for_file: depend_on_referenced_packages, sort_child_properties_last, file_names, must_be_immutable

import 'package:discountsstore_app/core/constant/color.dart';
import 'package:discountsstore_app/core/constant/imgaeasset.dart';
import 'package:discountsstore_app/dataHelp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: AppColor.secondColor,
      backgroundColor: AppColor.black,
      child: SafeArea(
          child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Image.asset(
                  AppImageAsset.logo55,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(22),
                    bottomRight: Radius.circular(22)),
                color: AppColor.backgroundcolor),
          ),

          ///12
          const SizedBox(height: 50),

          NewMaterialButton(
            title: 'الصفحة الرئيسية',
            onPressed: () {
              Get.back();
            },
            icon: Icons.home,
            colortitle: AppColor.black,
            colorIcon: Colors.blue,
          ),
          NewMaterialButton(
            title: 'معلومات التطبيق',
            onPressed: () {
              Get.defaultDialog(
                  backgroundColor: AppColor.black,
                  title: ' Discounts Store تطبيق',
                  titleStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColor.primary2,
                  ),
                  middleTextStyle:
                      const TextStyle(color: AppColor.backgroundcolor),
                  middleText: ' يمنحك الخصم المباشر ',
                  actions: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.center,
                      child: const Text(
                        'على عمليات شرائك من خلال كارت الخصم فى كل عمليه شراء يساعدك هذا التطبيق على الاطلاع على كل نسب الخصم والعروض لكل العملاء الموجودين داخل التطبيق من خلال\n نسب الخصم المتنوعه فى كل عمليه شراء من داخل التطبيق من خلال الكود الموجود على كارت الخصم المباشر',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColor.backgroundcolor),
                      ),
                    ),
                  ]);
            },
            icon: Icons.menu_book,
            colortitle: AppColor.black,
            colorIcon: Colors.blue,
          ),
          NewMaterialButton(
            title: 'خدمة العملاء',
            onPressed: () {
              OnPressedUrl('https://wa.me/0201021559201');
            },
            icon: Icons.phone,
            colortitle: AppColor.black,
            colorIcon: Colors.blue,
          ),
          NewMaterialButton(
            title: 'الدعم والمساعدة',
            onPressed: () {
              OnPressedUrl('https://wa.me/0201030131985');
            },
            icon: Icons.settings,
            colortitle: AppColor.black,
            colorIcon: Colors.blue,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: () {
                  OnPressedUrl(
                      'https://www.instagram.com/discounts_stor3/');
                },
                child: Image.asset('assets/images/instagramMenu.png',
                    fit: BoxFit.cover, width: 50),
              ),
              MaterialButton(
                onPressed: () {
                  OnPressedUrl(
                      'https://www.facebook.com/profile.php?id=100090089131158');
                },
                child: Image.asset('assets/images/facebookMenu.png',
                    fit: BoxFit.cover, width: 50),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          )
        ],
      )),
    );
  }
}

//////////////////////////////////////////////

class NewMaterialButton extends StatelessWidget {
  NewMaterialButton(
      {super.key,
      required this.title,
      required this.colortitle,
      required this.icon,
      required this.onPressed,
      required this.colorIcon});
  String title;
  Color colortitle;
  IconData icon;
  void Function()? onPressed;
  Color colorIcon;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: AppColor.backgroundcolor,
      padding: const EdgeInsets.symmetric(horizontal: 1),
      onPressed: onPressed,
      child: Column(
        children: [
          Card(
            color: AppColor.primary2,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            elevation: 8,
            child: ListTile(
              title: Text(
                title,
                style: const TextStyle(
                    color: AppColor.backgroundcolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              leading: Icon(icon, color: colorIcon),
            ),
          ),
        ],
      ),
    );
  }
}
