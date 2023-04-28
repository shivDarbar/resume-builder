// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;

  // final Icon prefixIcon;
  final TextInputType? keyboardType;
  final Function()? onChanged;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,

    // required this.prefixIcon,
    this.keyboardType,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      // cursorColor: HexColor("#4f4f4f"),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        // fillColor: HexColor("#f0f3f1"),
        contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),

        // hintStyle: GoogleFonts.poppins(
        //   fontSize: 15,
        //   color: HexColor("#8d8d8d"),
        // ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        // prefixIcon: prefixIcon,
        // prefixIconColor: HexColor("#4f4f4f"),
        filled: true,
      ),
    );
  }
}
