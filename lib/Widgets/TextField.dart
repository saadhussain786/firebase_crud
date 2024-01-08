import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  String lable1;
  String hintText1;
  TextEditingController controller1;
  IconData icon1;
  bool isShow;
  final String? Function(String?)? validator1;


  CustomTextField(
      {required this.lable1,
      required this.hintText1,
      required this.controller1,
      required this.icon1,
      required this.isShow,
      this.validator1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator1,

      controller: controller1,
      obscureText: isShow,
      decoration: InputDecoration(
          border: OutlineInputBorder(

          ),
          label: Text('$lable1'),
          hintText: "$hintText1",
          prefixIcon: Icon(icon1)
      ),

    );
  }
}