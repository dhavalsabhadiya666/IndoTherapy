import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/colors.dart';
import '../utils/font_style_utils.dart';

class CustomInputField extends StatefulWidget {
  final TextEditingController? fieldController;
  final String fieldName;
  final String? hint;
  final TextInputType? fieldInputType;
  final bool? enabled;
  final Color? bgColor;
  final int? maxLength;
  final int? maxLine;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String?>? onChange;
  final ValueChanged<String?>? onSave;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Widget? suffixIcon;
  final bool? obscureText;
  final bool? isRead;
  final String? labelTxt;
  final String? counterTxt;
  final Widget? labelStyle;
  final Widget? suffix;
  final double? contentpadding;
  final List<TextInputFormatter>? inputFormatters;

  CustomInputField(
      {required this.fieldName,
      this.bgColor,
      this.fieldInputType,
      this.enabled,
      this.maxLength,
      this.maxLine,
      this.validator,
      this.onTap,
      this.onSave,
      this.hint,
      this.prefixIcon,
      this.prefix,
      this.suffixIcon,
      this.suffix,
      this.obscureText,
      this.contentpadding,
      this.onChange,
      this.labelTxt,
      this.isRead,
      this.counterTxt,
      this.labelStyle,
      this.fieldController,
      this.inputFormatters});

  @override
  _CustomInputField_State createState() => _CustomInputField_State();
}

class _CustomInputField_State extends State<CustomInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.isRead ?? false,
      inputFormatters: widget.inputFormatters,
      style: FontTextStyle.poppinsW4S16greyShade9,
      controller: widget.fieldController,
      keyboardType: widget.fieldInputType ?? TextInputType.text,
      textInputAction: TextInputAction.next,
      enabled: widget.enabled ?? true,
      maxLines: widget.maxLength ?? 1,
      validator: widget.validator ?? null,
      obscureText: widget.obscureText ?? false,
      onTap: widget.onTap ?? null,
      onChanged: widget.onChange ?? null,
      onSaved: widget.onSave ?? null,
      cursorColor: ColorUtils.greyShade4,
      decoration: InputDecoration(
        counterText: widget.counterTxt ?? null,
        counterStyle: FontTextStyle.poppinsW4S16greyShade4,
        hintText: widget.hint ?? "",
        hintStyle: FontTextStyle.poppinsW4S16greyShade4,
        labelText: widget.fieldName,
        labelStyle: FontTextStyle.poppinsW4S16greyShade4,
        prefixIcon: widget.prefixIcon,
        prefix: widget.prefix,
        suffixIcon: widget.suffixIcon,
        suffix: widget.suffix,
        helperMaxLines: widget.maxLine,
        /*  border: OutlineInputBorder(
            borderSide: BorderSide(color: ColorUtils.greyShade2),
            borderRadius: BorderRadius.circular(10)),*/
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorUtils.greyShade2),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorUtils.greyShade2),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
