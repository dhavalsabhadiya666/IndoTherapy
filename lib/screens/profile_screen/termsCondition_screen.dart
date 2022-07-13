import 'package:flutter/material.dart';
import 'package:rewire/utils/font_style_utils.dart';
import 'package:rewire/utils/strings.dart';

import '../../utils/asset_paths.dart';
import '../../utils/colors.dart';
import '../../utils/constant.dart';

class TermsConditionScreen extends StatefulWidget {
  const TermsConditionScreen({Key? key}) : super(key: key);

  @override
  State<TermsConditionScreen> createState() => _TermsConditionScreenState();
}

class _TermsConditionScreenState extends State<TermsConditionScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(termsConditionBg), fit: BoxFit.fill)),
      child: SafeArea(
        child: Scaffold(
            backgroundColor: ColorUtils.transparent,
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
                          Txt.termsConditionTxt,
                          style: FontTextStyle.poppinsW6S20greyShade9,
                        ),
                      ],
                    ),
                    SizedBox(height: AppConstant.size20),
                    Row(
                      children: [
                        Icon(
                          Icons.brightness_1_rounded,
                          size: 10,
                          color: ColorUtils.greyShade9,
                        ),
                        const SizedBox(
                          width: AppConstant.size10,
                        ),
                        Text(
                          Txt.loremIpsumTxt,
                          style: FontTextStyle.poppinsW5S18greyShade9,
                        )
                      ],
                    ),
                    SizedBox(height: AppConstant.size10),
                    Row(
                      children: [
                        SizedBox(width: AppConstant.size20),
                        Expanded(
                          child: Text(
                            Txt.loremIpsumDesTxt,
                            style: FontTextStyle.poppinsW4S16greyShade7,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppConstant.size10),
                    Row(
                      children: [
                        Icon(
                          Icons.brightness_1_rounded,
                          size: 10,
                          color: ColorUtils.greyShade9,
                        ),
                        const SizedBox(
                          width: AppConstant.size10,
                        ),
                        Text(
                          Txt.whatIsLoremIpsumTxt,
                          style: FontTextStyle.poppinsW5S18greyShade9,
                        )
                      ],
                    ),
                    SizedBox(height: AppConstant.size10),
                    Row(
                      children: [
                        SizedBox(width: AppConstant.size20),
                        Expanded(
                          child: Text(
                            Txt.whatIsLoremIpsumDesTxt,
                            style: FontTextStyle.poppinsW4S16greyShade7,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppConstant.size10),
                    Row(
                      children: [
                        Icon(
                          Icons.brightness_1_rounded,
                          size: 10,
                          color: ColorUtils.greyShade9,
                        ),
                        const SizedBox(
                          width: AppConstant.size10,
                        ),
                        Text(
                          Txt.whyDoWeUseItTxt,
                          style: FontTextStyle.poppinsW5S18greyShade9,
                        )
                      ],
                    ),
                    SizedBox(height: AppConstant.size10),
                    Row(
                      children: [
                        SizedBox(width: AppConstant.size20),
                        Expanded(
                          child: Text(
                            Txt.whyDoWeUseItDesTxt,
                            style: FontTextStyle.poppinsW4S16greyShade7,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppConstant.size10),
                    Row(
                      children: [
                        Icon(
                          Icons.brightness_1_rounded,
                          size: 10,
                          color: ColorUtils.greyShade9,
                        ),
                        const SizedBox(
                          width: AppConstant.size10,
                        ),
                        Text(
                          Txt.whereCanIGetsomeTxt,
                          style: FontTextStyle.poppinsW5S18greyShade9,
                        )
                      ],
                    ),
                    SizedBox(height: AppConstant.size10),
                    Row(
                      children: [
                        SizedBox(width: AppConstant.size20),
                        Expanded(
                          child: Text(
                            Txt.whereCanIGetsomeDesTxt,
                            style: FontTextStyle.poppinsW4S16greyShade7,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppConstant.size10),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
