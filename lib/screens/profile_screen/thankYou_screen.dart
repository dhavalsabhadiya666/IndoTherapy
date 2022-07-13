import 'package:flutter/material.dart';
import 'package:rewire/screens/bottom_navy_bar/bottom_navy_bar_screen.dart';
import 'package:rewire/utils/asset_paths.dart';
import 'package:rewire/utils/colors.dart';
import 'package:rewire/utils/constant.dart';
import 'package:rewire/utils/font_style_utils.dart';
import 'package:rewire/utils/strings.dart';
import 'package:rewire/widgets/custom_button.dart';

class ThankYouScreen extends StatefulWidget {
  const ThankYouScreen({Key? key}) : super(key: key);

  @override
  State<ThankYouScreen> createState() => _ThankYouScreenState();
}

class _ThankYouScreenState extends State<ThankYouScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.pastelBlue,
      body: Center(
        child: Container(
          width: AppConstant.displayWidth(context),
          height: 222,
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 10),
          margin: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                  image: AssetImage(thankYouBg), fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                Txt.thankYouTxt,
                style: FontTextStyle.poppinsW6S32greyShade9,
              ),
              Text(
                Txt.thankYouDesTxt,
                textAlign: TextAlign.center,
                style: FontTextStyle.poppinsW4S12greyShade9
                    .copyWith(color: ColorUtils.greyShade5),
              ),
              CustomButton(
                title: "Back to home",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BottomNavigationScreen(),
                      ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
