// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class TextFieldItem extends StatelessWidget {
  var controller = TextEditingController();
  String hintText;
  String label;

  TextFieldItem(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      child: ListTile(
          title: TextFormField(
              controller: controller,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: label,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: hintText,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Data tidak boleh kosong';
                }
                return null;
              })),
    );
  }
}
