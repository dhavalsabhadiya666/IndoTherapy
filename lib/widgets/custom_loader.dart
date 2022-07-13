import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:rewire/utils/colors.dart';

class CustomLoader extends StatefulWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  _CustomLoaderState createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white.withOpacity(0.33),
      child: Center(
        child: LoadingAnimationWidget.horizontalRotatingDots(
            color: ColorUtils.primaryOrange, size: 55),
      ),
    );
  }
}
