import 'package:bloc_clean_arxitectura/common/utils/widgets/app_style.dart';
import 'package:bloc_clean_arxitectura/common/utils/widgets/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.keyboardType,
      required this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      this.hintStyle,
      required this.controller,
      this.onChanged,
      this.marginHori = 20
      });

  final TextInputType? keyboardType;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? hintStyle;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final double marginHori;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(horizontal: marginHori),
      height: 50,
      decoration: BoxDecoration(
        color: AppConst.kLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        cursorHeight: 25,
        onChanged: (value) {
          onChanged?.call(value);
        },
        style: appStyle(18, AppConst.kBKDark, FontWeight.w700),
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          suffixIconColor: AppConst.kBKDark,
          hintStyle: hintStyle,
          border: InputBorder.none
          // errorBorder: const OutlineInputBorder(
          //     borderRadius: BorderRadius.zero,
          //     borderSide: BorderSide(color: AppConst.kRed, width: 0.5)),
          // focusedBorder: const OutlineInputBorder(
          //     borderRadius: BorderRadius.zero,
          //     borderSide: BorderSide(color: Colors.transparent, width: 0.5)),
          // focusedErrorBorder: const OutlineInputBorder(
          //     borderRadius: BorderRadius.zero,
          //     borderSide: BorderSide(color: AppConst.kGreyBk, width: 0.5)),
          // disabledBorder: const OutlineInputBorder(
          //     borderRadius: BorderRadius.zero,
          //     borderSide: BorderSide(color: AppConst.kRed, width: 0.5)),
          // enabledBorder: const OutlineInputBorder(
          //     borderRadius: BorderRadius.zero,
          //     borderSide: BorderSide(color: AppConst.kBKDark, width: 0.5)),
        ),
      ),
    );
  }
}
