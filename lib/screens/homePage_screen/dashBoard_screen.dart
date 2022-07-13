import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/asset_paths.dart';
import '../../utils/colors.dart';
import '../../utils/constant.dart';
import '../../utils/font_style_utils.dart';
import '../../utils/strings.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.pastelBlue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Image(
              image: AssetImage(frameLogo),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              Txt.dashBoardTxt,
              style: FontTextStyle.poppinsW6S24white,
            ),
          ),
          Expanded(
            child: Container(
              height: AppConstant.displayHeight(context),
              width: AppConstant.displayWidth(context),
              decoration: BoxDecoration(
                  color: ColorUtils.white,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(25))),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    width: AppConstant.displayWidth(context),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: ColorUtils.grey.withOpacity(0.2),
                              blurRadius: 5)
                        ],
                        borderRadius: BorderRadius.circular(16),
                        color: ColorUtils.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Txt.completedCourseTxt,
                          style: FontTextStyle.poppinsW6S16greyShade9,
                        ),
                        SizedBox(height: AppConstant.size10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: AppConstant.displayWidth(context) * 0.7,
                              child: LinearProgressIndicator(
                                value: 0.60,
                                color: ColorUtils.stromCloud,
                                backgroundColor: ColorUtils.stromCloud3,
                              ),
                            ),
                            SizedBox(width: AppConstant.size5),
                            Text(
                              "60%",
                              style: FontTextStyle.poppinsW5S12greyShade5
                                  .copyWith(color: ColorUtils.greyShade9),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 16),
                              height: 115,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(dashBoardImage1))),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "02",
                                          style: FontTextStyle
                                              .poppinsW6S40greyShade9,
                                        ),
                                        SizedBox(width: AppConstant.size5),
                                        Text(
                                          "Hours",
                                          style: FontTextStyle
                                              .poppinsW4S16greyShade9,
                                        )
                                      ],
                                    ),
                                    Text(
                                      "Total Time",
                                      style:
                                          FontTextStyle.poppinsW5S14greyShade8,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 16),
                              height: 115,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(dashBoardImage2))),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "04",
                                          style: FontTextStyle
                                              .poppinsW6S40greyShade9,
                                        ),
                                        SizedBox(width: AppConstant.size5),
                                        Text(
                                          "Days",
                                          style: FontTextStyle
                                              .poppinsW4S16greyShade9,
                                        )
                                      ],
                                    ),
                                    Text(
                                      "Daily Streak",
                                      style:
                                          FontTextStyle.poppinsW5S14greyShade8,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
