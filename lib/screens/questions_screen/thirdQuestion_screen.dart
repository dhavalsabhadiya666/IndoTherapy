import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rewire/screens/authentication_screen/signUp_screen.dart';
import 'package:rewire/screens/models/question_model.dart';
import 'package:rewire/screens/plans_screen/allPlan_screen.dart';
import 'package:rewire/screens/questions_screen/secondQuestion_screen.dart';
import 'package:rewire/utils/colors.dart';
import 'package:rewire/utils/constant.dart';
import 'package:rewire/utils/font_style_utils.dart';
import 'package:rewire/utils/strings.dart';

import '../../utils/asset_paths.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_loader.dart';

class ThirdQuestionScreen extends StatefulWidget {
  QuestionModel questions;
  ThirdQuestionScreen({Key? key, required QuestionModel this.questions})
      : super(key: key);

  @override
  State<ThirdQuestionScreen> createState() => _ThirdQuestionScreenState();
}

class _ThirdQuestionScreenState extends State<ThirdQuestionScreen> {
  bool isLoader = false;

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(backgroundImage), fit: BoxFit.fill)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.fromLTRB(16, 70, 16, 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_outlined,
                          color: ColorUtils.greyShade9,
                        ),
                      ),
                      SizedBox(width: AppConstant.size20),
                      Text(
                        Txt.questionTxt,
                        style: FontTextStyle.poppinsW5S20stromCloud,
                      ),
                      Spacer(),
                      Text(
                        Txt.skipTxt,
                        style: FontTextStyle.poppinsW5S16primaryOrange,
                      ),
                    ],
                  ),
                  SizedBox(height: AppConstant.size20),
                  LinearProgressIndicator(
                    value: 1,
                    color: ColorUtils.primaryOrange,
                    backgroundColor: ColorUtils.greyShade2,
                  ),
                  SizedBox(height: AppConstant.size50),
                  Text(
                    Txt.question3Txt,
                    style: FontTextStyle.poppinsW7S24greyShade7,
                  ),
                  SizedBox(height: AppConstant.size20),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      setState(() {
                        index = 1;
                      });
                    },
                    child: Container(
                      height: 56,
                      width: AppConstant.displayWidth(context),
                      decoration: BoxDecoration(
                          color: index == 1
                              ? ColorUtils.primaryOrangeShade5
                              : ColorUtils.greyShade1.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 20),
                        child: Row(
                          children: [
                            Text(
                              "Option 1",
                              style: FontTextStyle.poppinsW5S14greyShade4,
                            ),
                            Spacer(),
                            index == 1
                                ? Icon(Icons.check_circle_rounded,
                                    color: ColorUtils.primaryOrange)
                                : SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: AppConstant.size20),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      setState(() {
                        index = 2;
                      });
                    },
                    child: Container(
                      height: 56,
                      width: AppConstant.displayWidth(context),
                      decoration: BoxDecoration(
                          color: index == 2
                              ? ColorUtils.primaryOrangeShade5
                              : ColorUtils.greyShade1.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 20),
                        child: Row(
                          children: [
                            Text(
                              "Option 2",
                              style: FontTextStyle.poppinsW5S14greyShade4,
                            ),
                            Spacer(),
                            index == 2
                                ? Icon(Icons.check_circle_rounded,
                                    color: ColorUtils.primaryOrange)
                                : SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: AppConstant.size20),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      setState(() {
                        index = 3;
                      });
                    },
                    child: Container(
                      height: 56,
                      width: AppConstant.displayWidth(context),
                      decoration: BoxDecoration(
                          color: index == 3
                              ? ColorUtils.primaryOrangeShade5
                              : ColorUtils.greyShade1.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 20),
                        child: Row(
                          children: [
                            Text(
                              "Option 3",
                              style: FontTextStyle.poppinsW5S14greyShade4,
                            ),
                            Spacer(),
                            index == 3
                                ? Icon(Icons.check_circle_rounded,
                                    color: ColorUtils.primaryOrange)
                                : SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  CustomButton(
                      title: Txt.nextTxt,
                      onPressed: () async {
                        if (index != null) {
                          setState(() {
                            isLoader = true;
                          });
                          // widget.questions.questionThree = index.toString();
                          setState(() {
                            isLoader = true;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SignUpScreen(questions: widget.questions),
                              ));
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
        isLoader == true ? CustomLoader() : SizedBox.shrink()
      ],
    );
  }
}
