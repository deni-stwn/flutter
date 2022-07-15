import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldItem extends StatelessWidget {
  var controller = TextEditingController();
  String hintText;
  String label;

  TextFieldItem(
      {required this.controller, required this.hintText, required this.label});

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
              })),
    );
  }
}
