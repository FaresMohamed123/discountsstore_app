// ignore_for_file: depend_on_referenced_packages

import 'package:discountsstore_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonLang extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CustomButtonLang({Key? key, required this.textbutton, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 8,
      //  padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 50),
      //  width: double.infinity,
       // decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),),
        child: MaterialButton(
          color: AppColor.primaryColor,
          textColor: Colors.white,
          onPressed: onPressed,
          child: Text(textbutton,
              style: const TextStyle(fontWeight: FontWeight.bold,
              fontSize: 28)),
        ),
      ),
    );
  }
}
