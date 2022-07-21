import 'package:flutter/material.dart';
import 'package:whatsapp_auto/Utils/size_utils.dart';
import 'package:whatsapp_auto/theme/app_color.dart';

class AppTextField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final String? hintText;
  int? maxLines = 1;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;

  AppTextField({
    this.onChanged,
    this.keyboardType,
    this.contentPadding,
    this.maxLines,
    this.hintText,
    this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // enabled: true,
      onChanged: onChanged,
      style: TextStyle(
        color: AppColor.textColor,
        fontSize: SizeUtils.horizontalBlockSize * 5,
      ),
      // showCursor: false,
      keyboardType: keyboardType,
      controller: controller,
      maxLines: maxLines,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        filled: true,
        fillColor: AppColor.appBackgroundColor,
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: SizeUtils.fSize_14(),
            color: AppColor.textColor.withOpacity(0.5),
            fontWeight: FontWeight.w500),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
