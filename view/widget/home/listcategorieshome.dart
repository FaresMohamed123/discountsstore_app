// ignore_for_file: depend_on_referenced_packages, unused_import, invalid_use_of_protected_member, avoid_print

import 'package:cached_network_image/cached_network_image.dart';
import 'package:discountsstore_app/controller/home_controller.dart';
import 'package:discountsstore_app/core/constant/color.dart';
import 'package:discountsstore_app/core/constant/routes.dart';
import 'package:discountsstore_app/dat.dart';
import 'package:discountsstore_app/data/model/categoriesmodel.dart';
import 'package:discountsstore_app/linkapi.dart';
import 'package:discountsstore_app/view/widget/home/listitemshome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

CategoriesModel categoriesModel = CategoriesModel();

class ListCategoriesHome extends GetView<DatController> {
  const ListCategoriesHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => datController.loading2.value
        ? const CircularProgressIndicator(
            backgroundColor: AppColor.primary2,
            color: AppColor.thirdColor,
            strokeWidth: 10,
          )
        : SizedBox(
            height: 100,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(width: 15),
              itemCount: datController.category.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppColor.secondColor,
                          borderRadius: BorderRadius.circular(20)),
                      height: 70,
                      width: 70,
                      child: InkWell(
                        onTap: () {
                          datController.getdatat(datController.category.value[index]['name']);
                        },
                        child: CachedNetworkImage(
                            imageUrl:
                                'https://dis-store.website/media/${datController.category.value[index]['image']}'
                            ),
                      ),
                    ),
                    Text(
                      datController.category.value[index]['name'],
                            style: const TextStyle(
                          fontSize: 13, color: AppColor.backgroundcolor),
                    )
                  ],
                );
              },
            ),
          ));
  }
}
