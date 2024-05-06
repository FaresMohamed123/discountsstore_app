// ignore_for_file: depend_on_referenced_packages, unrelated_type_equality_checks, must_be_immutable

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:discountsstore_app/core/class/crud.dart';
import 'package:discountsstore_app/view/widget/home/listitemshome.dart';
import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  final String titleappbar;
  final void Function()? onPressedIconid;
  final void Function()? onPressedSearch;
  CustomSearch(
      {Key? key,
      required this.titleappbar,
      this.onPressedIconid,
      this.onPressedSearch})
      : super(key: key);
  Crud crud = Crud();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Row(children: [
        Expanded(
            child: TextFormField(
          onChanged: (value) {
            datController.addsearch(value);
          },
          decoration: InputDecoration(
              prefixIcon: IconButton(
                  onPressed: onPressedSearch,
                  icon: const Icon(Icons.search_sharp)),
              hintText: "Find Product",
              hintStyle: const TextStyle(fontSize: 18),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: Colors.grey[200]),
        )),
        const SizedBox(width: 10),
        Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10)),
            width: 60,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: IconButton(
                onPressed: () {
                  AwesomeDialog(
                    context: context,
                    animType: AnimType.scale,
                    dialogType: DialogType.success,
                    body: Center(
                      child: TextFormField(
                        onChanged: (value) {
                          
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            //   prefixIcon: const Icon(Icons.search),
                            hintText: "type id",
                            hintStyle: const TextStyle(fontSize: 18),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            filled: true,
                            fillColor: Colors.grey[200]),
                      ),
                    ),
                    btnOkOnPress: () {
                     datController.findByCopon('00000');
                    },
                  ).show();
                },
                icon: Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.grey[600],
                ))),
      ]),
    );
  }
}
