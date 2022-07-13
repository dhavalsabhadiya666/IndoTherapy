import 'package:flutter/material.dart';

import '../../utils/asset_paths.dart';
import '../../utils/constant.dart';
import '../../utils/font_style_utils.dart';
import '../../utils/strings.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(termsConditionBg), fit: BoxFit.fill)),
      child: SafeArea(
          child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(height: AppConstant.size20),
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_outlined)),
                  SizedBox(width: AppConstant.size10),
                  Text(
                    Txt.AboutUsTxt,
                    style: FontTextStyle.poppinsW6S20greyShade9,
                  ),
                ],
              ),
              SizedBox(height: AppConstant.size20),
              Text(
                Txt.aboutUsDes1Txt,
                style: FontTextStyle.poppinsW4S16greyShade9,
              ),
              SizedBox(height: AppConstant.size20),
              Text(
                Txt.aboutUsDes2Txt,
                style: FontTextStyle.poppinsW4S16greyShade9,
              ),
              SizedBox(height: AppConstant.size20),
              Text(
                Txt.aboutUsDes3Txt,
                style: FontTextStyle.poppinsW4S16greyShade9,
              ),
              SizedBox(height: AppConstant.size20),
            ],
          )),
        ),
      )),
    );
  }
}
