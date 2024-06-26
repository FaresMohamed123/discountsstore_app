// ignore_for_file: depend_on_referenced_packages

import '/core/constant/imgaeasset.dart'; 
import 'package:flutter/material.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 95,
      backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(0), // Border radius
          child: ClipOval(
            child: Image.asset(
              AppImageAsset.logo55,
              fit: BoxFit.cover,
              height: 250,
               width: 200,
              
            ),
          ),
        ));
  }
}