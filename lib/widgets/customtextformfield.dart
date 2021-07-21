import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  TextEditingController editingController;
  String text;
  CustomTextField({required this.editingController, this.text = ""});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 24, 40, 12),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey,
          //     offset: Offset(2, 6),
          //     blurRadius: 10,
          //   )
          //]
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            //controller: authProvider.password,
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
