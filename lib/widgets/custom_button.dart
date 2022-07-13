import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/constant.dart';
import '../utils/font_style_utils.dart';

class CustomButton extends StatefulWidget {
  String title;
  Function()? onPressed;
  Color? backgroundColor;
  Color? textColor;

  CustomButton({
    required this.title,
    this.onPressed,
    this.textColor,
    this.backgroundColor,
  });

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: AppConstant.displayWidth(context),
      decoration: BoxDecoration(
        color: ColorUtils.primaryOrange,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
          onPressed: widget.onPressed,
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            overlayColor: MaterialStateProperty.all(
              ColorUtils.white.withOpacity(0.15),
            ),
          ),
          child: Text(widget.title, style: FontTextStyle.poppinsW5S16white)),
    );
  }
}
