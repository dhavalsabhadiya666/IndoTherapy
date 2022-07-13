import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rewire/screens/profile_screen/add_card_screen.dart';
import 'package:rewire/utils/asset_paths.dart';
import 'package:rewire/utils/colors.dart';
import 'package:rewire/utils/constant.dart';

import '../../utils/font_style_utils.dart';
import '../../utils/strings.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(backgroundImage), fit: BoxFit.fill)),
      child: SafeArea(
        child: Scaffold(
            backgroundColor: ColorUtils.transparent,
            body: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_outlined,
                          color: ColorUtils.greyShade9,
                        ),
                      ),
                      SizedBox(width: AppConstant.size10),
                      Text(
                        Txt.cardDetailsTxt,
                        style: FontTextStyle.poppinsW5S20stromCloud,
                      )
                    ],
                  ),
                ),
                SizedBox(height: AppConstant.displayHeight(context) * 0.15),
                SvgPicture.asset(
                  cardDetails,
                ),
                SizedBox(height: AppConstant.size10),
                Text(
                  "No recent card details please\nadd card Details",
                  textAlign: TextAlign.center,
                  style: FontTextStyle.poppinsW4S12greyShade4,
                ),
                SizedBox(height: AppConstant.size20),
                CupertinoButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const AddCardScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 40,
                    width: 126,
                    decoration: BoxDecoration(
                        color: ColorUtils.stromCloud,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        Txt.addCardTxt,
                        style: FontTextStyle.poppinsW5S16white,
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
