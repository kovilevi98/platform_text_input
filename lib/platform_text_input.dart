library platform_text_input;

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlatformTextInput extends StatelessWidget {
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final InputDecoration inputDecorator;
  final FocusNode? focusNode;
  final bool readOnly;
  final bool enabled;
  final void Function()? onTap;
  final void Function(String) onChanged;
  final void Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final int? minLines;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? borderRadius;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;

  PlatformTextInput({
    Key? key,
    required this.textInputAction,
    this.keyboardType = TextInputType.text,
    required this.controller,
    required this.onChanged,
    this.onTap,
    this.inputFormatters,
    this.onFieldSubmitted,
    required this.inputDecorator,
    this.focusNode,
    this.readOnly = false,
    this.enabled = true,
    this.obscureText = false,
    this.minLines,
    this.verticalPadding = 16,
    this.horizontalPadding = 8,
    this.borderRadius = 10,
    this.hintTextStyle,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: inputDecorator.fillColor ??
                Theme.of(context).inputDecorationTheme.fillColor,
            borderRadius: BorderRadius.circular(borderRadius!),
          ),
          child: Row(
            children: [
              Expanded(
                child: CupertinoTextFormFieldRow(
                  minLines: minLines,
                  maxLines: (minLines != null) ? minLines! + 10 : 1,
                  textAlignVertical: TextAlignVertical.center,
                  textInputAction: textInputAction,
                  keyboardType: keyboardType,
                  placeholderStyle: (hintTextStyle != null) ? hintTextStyle : TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  style: (textStyle != null) ? textStyle : TextStyle(
                    color:
                        enabled ? Colors.black : Colors.black.withOpacity(0.6),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: verticalPadding!,
                    horizontal: horizontalPadding!,
                  ),
                  readOnly: readOnly,
                  cursorHeight: 28,
                  onChanged: onChanged,
                  controller: controller,
                  focusNode: focusNode,
                  autofocus: false,
                  enabled: enabled,
                  obscureText: obscureText,
                  placeholder: inputDecorator.labelText,
                  validator: (s) => inputDecorator.errorText,
                  autovalidateMode: AutovalidateMode.always,
                  onFieldSubmitted: onFieldSubmitted,
                  inputFormatters: inputFormatters,
                ),
              ),
              if (inputDecorator.suffixIcon != null)
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: inputDecorator.suffixIcon!,
                ),
            ],
          ),
        ),
      );
    } else {
      return TextFormField(
        minLines: minLines,
        maxLines: (minLines != null) ? minLines! + 10 : 1,
        textAlignVertical: TextAlignVertical.center,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        onChanged: onChanged,
        controller: controller,
        focusNode: focusNode,
        autofocus: false,
        enabled: enabled,
        readOnly: readOnly,
        obscureText: obscureText,
        decoration: inputDecorator,
        style: (textStyle != null) ? textStyle : Theme.of(context).textTheme.subtitle1!.copyWith(
              color: enabled
                  ? Colors.black
                  : Colors.black.withOpacity(0.6),
            ),
        onFieldSubmitted: onFieldSubmitted,
        inputFormatters: inputFormatters,
        onTap: onTap,
      );
    }
  }
}
