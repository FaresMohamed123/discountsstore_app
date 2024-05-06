// ignore_for_file: depend_on_referenced_packages, unused_import, must_be_immutable, sized_box_for_whitespace, unnecessary_string_interpolations, invalid_use_of_protected_member

import 'package:cached_network_image/cached_network_image.dart';
import 'package:discountsstore_app/controller/auth/verifycode_controller.dart';
import 'package:discountsstore_app/core/constant/imgaeasset.dart';
import 'package:discountsstore_app/dat.dart';
import 'package:discountsstore_app/dataHelp.dart';
import '/controller/home_controller.dart';
import '/core/constant/color.dart';
import '/data/model/itemsmodel.dart';
import '/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

DatController datController = Get.put(DatController());
class ListItemsHome extends StatelessWidget {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => datController.loading.value
          ? const CircularProgressIndicator(
            backgroundColor: AppColor.primary2,
            color: AppColor.thirdColor,
           strokeWidth: 10)
          : Container(
              height: 600,
              child: ListView.builder(
                itemCount: datController.categoryList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 7,
                  shadowColor: AppColor.backgroundcolor,
                  margin: const EdgeInsets.only(top: 25),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: 
                              "https://dis-store.website${datController.categoryList.value[index]['images']}",
                              height: 250,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          MaterialButton(
                            padding: const EdgeInsets.only(right: 1),
                            onPressed: () {
                              OnPressedUrl(
                                datController.categoryList.value[index]['store_link'].toString(),
                              );
                            },
                            child: Container(
                              height: 250,
                              alignment: Alignment.bottomRight,
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.black.withOpacity(0),
                                    Colors.black.withOpacity(0.8),
                                  ],
                                  stops: const [0.6, 1],
                                ),
                              ),
                              child: Text(
                                datController.categoryList.value[index]['Title']
                                    .toString(),
                                style: const TextStyle(
                                    color: AppColor.backgroundcolor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: 20),
                                Text(
                                  ' ${datController.categoryList.value[index]['discount'].toString()}%',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: AppColor.primary2),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  datController
                                   .categoryList.value[index]['description'].toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: AppColor.black),
                                ),
                                const SizedBox(width: 10),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ),
        ),
    );
  }
}
