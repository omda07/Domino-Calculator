import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

class CustomTextFormFields extends StatelessWidget {
  TextEditingController controller;
  String myLabelText;
  IconData? prefixIcon;
  IconData? suffixIcon;
  bool canObscure = false;
  Function? onPressed;
  TextInputAction? status;
  TextInputType type = TextInputType.text;
  String? Function(String?)? validate;

  CustomTextFormFields({Key? key,
    required this.controller,
    required this.myLabelText,
    this.prefixIcon,
    this.suffixIcon,
    this.canObscure = false,
    this.onPressed,
    this.status,
    this.type = TextInputType.text,
    this.validate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      controller: controller,
      cursorColor: ColorManager.primary,
      validator: (value) {
        return validate!(value);
      },
      obscureText: canObscure,
      textInputAction: status ?? TextInputAction.done,
      decoration: InputDecoration(
        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
        errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
        focusedErrorBorder:
        Theme.of(context).inputDecorationTheme.focusedErrorBorder,
        contentPadding: Theme.of(context).inputDecorationTheme.contentPadding,
        hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
        labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
        errorStyle: Theme.of(context).inputDecorationTheme.errorStyle,
        prefixIcon: Icon(
          prefixIcon,
          color: ColorManager.primary,
        ),
        suffixIcon: IconButton(
          splashColor: ColorManager.primary,
          icon: Icon(
            suffixIcon,
            color: ColorManager.primary,
          ),
          onPressed: () {
            onPressed!();
          },
        ),
        labelText: myLabelText,
      ),
    );
  }
}