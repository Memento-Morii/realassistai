import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:realassistai/themes/theme_text.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    this.validator,
    this.icon,
    this.onSuffixButtonTap,
    this.suffixIcon,
    this.onSaved,
    this.onChanged,
    this.onFieldSubmitted,
    this.maxLength,
    this.obscureText = false,
    this.controller,
    this.keyboardType = TextInputType.name,
    this.inputAction = TextInputAction.done,
    this.height = 48,
    this.width = 0,
    this.borderRadius = 50,
    this.initialValue,
    this.inputFormatters,
  }) : super(key: key);
  final TextInputAction inputAction;
  final String? initialValue;
  final int? maxLength;
  final Function(String?)? onSaved;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Function()? onSuffixButtonTap;
  final String hintText;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final double height;
  final double width;
  final double borderRadius;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    final fieldWidth = width == 0 ? Get.width * 0.85 : width;
    return Container(
      width: fieldWidth,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: ThemeText.bodyOne,
        controller: controller,
        keyboardType: keyboardType,
        onSaved: onSaved,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        maxLength: maxLength,
        textInputAction: inputAction,
        minLines: keyboardType == TextInputType.multiline ? 3 : 1,
        maxLines: keyboardType == TextInputType.multiline ? 5 : 1,
        validator: validator,
        obscureText: obscureText,
        initialValue: initialValue,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(13),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
          // errorStyle: errorFormFieldTextStyle,
          // prefixIcon: Icon(
          //   icon,
          //   color: Colors.grey,
          // ),
          suffixIcon: IconButton(
            icon: Icon(suffixIcon),
            color: Colors.grey,
            onPressed: onSuffixButtonTap,
          ),
        ),
      ),
    );
  }
}
