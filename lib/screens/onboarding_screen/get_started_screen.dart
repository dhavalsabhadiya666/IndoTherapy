import 'package:flutter/material.dart';
import 'package:rewire/screens/authentication_screen/signIn_screen.dart';
import 'package:rewire/screens/questions_screen/fourthQuestion_screen.dart';
import 'package:rewire/utils/asset_paths.dart';
import 'package:rewire/utils/colors.dart';
import 'package:rewire/utils/constant.dart';
import 'package:rewire/utils/font_style_utils.dart';

import '../../utils/strings.dart';
import '../../widgets/custom_button.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.pastelBlue,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: AppConstant.displayHeight(context) / 3,
              decoration: const BoxDecoration(
                // color: ColorUtils.red,
                image: DecorationImage(
                  image: AssetImage(startedPage), /*fit: BoxFit.fitHeight*/
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              Txt.rewireTherapyTxt,
              textAlign: TextAlign.center,
              style: FontTextStyle.poppinsW6S32greyShade9,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                Txt.startedBodyTxt,
                style: FontTextStyle.poppinsW5S16greyShade7,
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              height: AppConstant.displayHeight(context) / 17,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(
                title: Txt.getStartedTxt,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const FourthQuestionScreen(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const SignInScreen(),
                  ),
                );
              },
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
              child: Text(Txt.signInTxt,
                  style: FontTextStyle.poppinsW5S16greyShade9),
            ),
          ],
        ),
      ),
    );
  }
}
