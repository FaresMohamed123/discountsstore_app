// ignore_for_file: depend_on_referenced_packages, must_be_immutable, file_names

import 'package:discountsstore_app/core/constant/color.dart';
import 'package:flutter/material.dart';
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
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            elevation: 8,
            child: ListTile(
              title: Text(
                title,
                style: TextStyle(
                    color: colortitle,
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

