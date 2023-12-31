import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:silky_care/src/common/constants/colors_constant.dart';

class ScTextField extends StatefulWidget {
  const ScTextField({
    Key? key,
    this.placeholder,
    required this.lableText,
    this.prefixIcon,
    this.suffixIcon,
    this.iconPressed,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.onChanged,
    this.borderColor,
    this.enableBorderColor,
    this.labelStyle,
    this.inputFormatters,
    this.textInputType,
    this.borderRadius, this.backgroundColor,
  }) : super(key: key);

  final String? placeholder;
  final Color? backgroundColor;
  final String lableText;
  final double? borderRadius;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final Function()? iconPressed;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String? text)? validator;
  final Color? borderColor;
  final Color? enableBorderColor;
  final TextStyle? labelStyle;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;

  @override
  State<ScTextField> createState() => _ScTextFieldState();
}

class _ScTextFieldState extends State<ScTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: widget.backgroundColor ?? AppColors.grey2,
          borderRadius: BorderRadius.circular(widget.borderRadius??15)),
      child: TextFormField(
        keyboardType: widget.textInputType,
        inputFormatters: widget.inputFormatters,
        scrollPadding: EdgeInsets.zero,
        validator: widget.validator,
        controller: widget.controller,
        obscureText: widget.obscureText,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 15),
          enabledBorder: OutlineInputBorder(
              gapPadding: 2,
              borderSide: BorderSide(
                color: widget.enableBorderColor ?? AppColors.grey,
              ),
              borderRadius: BorderRadius.circular(16)),
          prefixIconColor: Colors.black,
          suffixIconColor: Colors.black,
          focusedBorder: OutlineInputBorder(
            gapPadding: 2,
            borderSide: BorderSide(color: widget.borderColor ?? Colors.black),
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 15),
          ),
          focusColor: Colors.black,
          iconColor: Colors.black,
          hoverColor: Colors.black,
          labelText: widget.lableText,
          labelStyle:
              widget.labelStyle ?? const TextStyle(color: AppColors.grey),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          border: OutlineInputBorder(
            gapPadding: 2,
            borderSide: const BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(
              15,
            ),
          ),
          fillColor: AppColors.grey,
          hintText: widget.placeholder,
        ),
      ),
    );
  }
}
