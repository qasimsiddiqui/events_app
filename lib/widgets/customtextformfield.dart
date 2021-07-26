import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  TextEditingController editingController;
  String text;
  TextInputType textype;
  double height;
  CustomTextField(
      {required this.editingController,
      this.text = "",
      this.textype = TextInputType.text,
      this.height = 55});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 24, 40, 12),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          // color: Colors.grey.shade200,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            keyboardType: textype,
            validator: (value) {
              if (value!.isEmpty) {
                return "please fill";
              }
            },
            controller: editingController,
            decoration: InputDecoration(
              hintText: text,
              border: InputBorder.none,
              //icon: Icon(Icons.lock)
            ),
          ),
        ),
      ),
    );
  }
}
