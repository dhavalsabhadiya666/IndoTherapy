import 'package:flutter/material.dart';
import 'package:rewire/utils/colors.dart';
import 'package:rewire/utils/constant.dart';
import 'package:rewire/utils/font_style_utils.dart';
import 'package:rewire/widgets/custom_button.dart';
import '../../utils/asset_paths.dart';
import '../../utils/strings.dart';
import 'get_started_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with SingleTickerProviderStateMixin {
  PageController? _pageController;
  int selected = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.pastelBlue,
      body: Container(
        height: AppConstant.displayHeight(context),
        width: AppConstant.displayWidth(context),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                onPageChanged: (value) {
                  setState(() {
                    selected = value;
                  });
                },
                controller: _pageController,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: AppConstant.displayHeight(context) / 3,
                          width: AppConstant.displayWidth(context),
                          // color: Colors.grey,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(onBoarding1Image),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppConstant.displayHeight(context) / 20,
                        ),
                        SizedBox(
                          width: AppConstant.displayWidth(context) / 1.8,
                          child: Text(
                            Txt.onBoarding1TitleTxt,
                            textAlign: TextAlign.center,
                            style: FontTextStyle.poppinsW7S20stromCloud,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          Txt.onBoarding1BodyTxt,
                          style: FontTextStyle.poppinsW4S16greyShade7,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: AppConstant.displayHeight(context) / 3,
                          width: AppConstant.displayWidth(context),
                          // color: Colors.grey,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(onBoarding2Image),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppConstant.displayHeight(context) / 20,
                        ),
                        SizedBox(
                          width: AppConstant.displayWidth(context) / 1.3,
                          child: Text(
                            Txt.onBoarding2TitleTxt,
                            textAlign: TextAlign.center,
                            style: FontTextStyle.poppinsW7S20stromCloud,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: AppConstant.displayWidth(context) / 1.4,
                          child: Text(
                            Txt.onBoarding2BodyTxt,
                            style: FontTextStyle.poppinsW4S16greyShade7,
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: AppConstant.displayHeight(context) / 3,
                          width: AppConstant.displayWidth(context),
                          // color: Colors.grey,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(onBoarding3Image),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppConstant.displayHeight(context) / 20,
                        ),
                        SizedBox(
                          width: AppConstant.displayWidth(context) / 1.5,
                          child: Text(
                            Txt.onBoarding3TitleTxt,
                            textAlign: TextAlign.center,
                            style: FontTextStyle.poppinsW7S20stromCloud,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: AppConstant.displayWidth(context) / 1.3,
                          child: Text(
                            Txt.onBoarding3BodyTxt,
                            style: FontTextStyle.poppinsW4S16greyShade7,
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: AppConstant.displayHeight(context) / 3,
                          width: AppConstant.displayWidth(context),
                          // color: Colors.grey,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(onBoarding4Image),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppConstant.displayHeight(context) / 20,
                        ),
                        SizedBox(
                          width: AppConstant.displayWidth(context) / 1.5,
                          child: Text(
                            Txt.onBoarding4TitleTxt,
                            textAlign: TextAlign.center,
                            style: FontTextStyle.poppinsW7S20stromCloud,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: AppConstant.displayWidth(context) / 1.4,
                          child: Text(
                            Txt.onBoarding4BodyTxt,
                            style: FontTextStyle.poppinsW4S16greyShade7,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  4,
                  (index) => Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: selected == index
                                ? ColorUtils.primaryOrange
                                : ColorUtils.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: 6,
                          width: selected == index ? 25 : 6,
                        ),
                      )),
            ),
            selected == 3
                ? SizedBox(
                    height: AppConstant.displayHeight(context) / 16,
                  )
                : SizedBox(
                    height: AppConstant.displayHeight(context) / 10,
                  ),
            selected == 3
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomButton(
                      title: Txt.getStartedTxt,
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const GetStartedScreen()),
                            (Route<dynamic> route) => false);
                      },
                    ),
                  )
                : const SizedBox.shrink(),
            SizedBox(
              height: AppConstant.displayHeight(context) / 17,
            )
          ],
        ),
      ),
    );
  }
}
