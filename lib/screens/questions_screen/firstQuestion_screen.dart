import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rewire/screens/models/question_model.dart';
import 'package:rewire/screens/questions_screen/secondQuestion_screen.dart';
import 'package:rewire/utils/colors.dart';
import 'package:rewire/utils/constant.dart';
import 'package:rewire/utils/font_style_utils.dart';
import 'package:rewire/utils/strings.dart';

import '../../utils/asset_paths.dart';
import '../../widgets/custom_button.dart';

class FirstQuestionScreen extends StatefulWidget {
  QuestionModel questions;
  FirstQuestionScreen({Key? key, required QuestionModel this.questions})
      : super(key: key);

  @override
  State<FirstQuestionScreen> createState() => _FirstQuestionScreenState();
}

class _FirstQuestionScreenState extends State<FirstQuestionScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(backgroundImage), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              SizedBox(height: AppConstant.size70),
              Row(
                children: [
                  Icon(
                    Icons.arrow_back_outlined,
                    color: ColorUtils.greyShade9,
                  ),
                  const SizedBox(width: AppConstant.size20),
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
                value: 0.33,
                color: ColorUtils.primaryOrange,
                backgroundColor: ColorUtils.greyShade2,
              ),
              SizedBox(height: AppConstant.size50),
              Text(
                Txt.question1Txt,
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
                  height: 74,
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
                          Txt.questionOpt1Txt,
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
                  height: 74,
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
                          Txt.questionOpt2Txt,
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
                          Txt.questionOpt3Txt,
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
              SizedBox(height: AppConstant.size20),
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  setState(() {
                    index = 4;
                  });
                },
                child: Container(
                  height: 56,
                  width: AppConstant.displayWidth(context),
                  decoration: BoxDecoration(
                      color: index == 4
                          ? ColorUtils.primaryOrangeShade5
                          : ColorUtils.greyShade1.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          Txt.questionOpt4Txt,
                          style: FontTextStyle.poppinsW5S14greyShade4,
                        ),
                        Spacer(),
                        index == 4
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
                    index = 5;
                  });
                },
                child: Container(
                  height: 56,
                  width: AppConstant.displayWidth(context),
                  decoration: BoxDecoration(
                      color: index == 5
                          ? ColorUtils.primaryOrangeShade5
                          : ColorUtils.greyShade1.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          Txt.questionOpt5Txt,
                          style: FontTextStyle.poppinsW5S14greyShade4,
                        ),
                        Spacer(),
                        index == 5
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
                    index = 6;
                  });
                },
                child: Container(
                  height: 56,
                  width: AppConstant.displayWidth(context),
                  decoration: BoxDecoration(
                      color: index == 6
                          ? ColorUtils.primaryOrangeShade5
                          : ColorUtils.greyShade1.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          Txt.questionOpt6Txt,
                          style: FontTextStyle.poppinsW5S14greyShade4,
                        ),
                        Spacer(),
                        index == 6
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
                    index = 7;
                  });
                },
                child: Container(
                  height: 56,
                  width: AppConstant.displayWidth(context),
                  decoration: BoxDecoration(
                      color: index == 7
                          ? ColorUtils.primaryOrangeShade5
                          : ColorUtils.greyShade1.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          Txt.questionOpt7Txt,
                          style: FontTextStyle.poppinsW5S14greyShade4,
                        ),
                        Spacer(),
                        index == 7
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
                    index = 8;
                  });
                },
                child: Container(
                  height: 56,
                  width: AppConstant.displayWidth(context),
                  decoration: BoxDecoration(
                      color: index == 8
                          ? ColorUtils.primaryOrangeShade5
                          : ColorUtils.greyShade1.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          Txt.questionOpt8Txt,
                          style: FontTextStyle.poppinsW5S14greyShade4,
                        ),
                        Spacer(),
                        index == 8
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
                    index = 9;
                  });
                },
                child: Container(
                  height: 56,
                  width: AppConstant.displayWidth(context),
                  decoration: BoxDecoration(
                      color: index == 9
                          ? ColorUtils.primaryOrangeShade5
                          : ColorUtils.greyShade1.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          Txt.questionOpt9Txt,
                          style: FontTextStyle.poppinsW5S14greyShade4,
                        ),
                        Spacer(),
                        index == 9
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
                    index = 10;
                  });
                },
                child: Container(
                  height: 56,
                  width: AppConstant.displayWidth(context),
                  decoration: BoxDecoration(
                      color: index == 10
                          ? ColorUtils.primaryOrangeShade5
                          : ColorUtils.greyShade1.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          Txt.questionOpt10Txt,
                          style: FontTextStyle.poppinsW5S14greyShade4,
                        ),
                        Spacer(),
                        index == 10
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
                    index = 11;
                  });
                },
                child: Container(
                  height: 56,
                  width: AppConstant.displayWidth(context),
                  decoration: BoxDecoration(
                      color: index == 11
                          ? ColorUtils.primaryOrangeShade5
                          : ColorUtils.greyShade1.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          Txt.questionOpt11Txt,
                          style: FontTextStyle.poppinsW5S14greyShade4,
                        ),
                        Spacer(),
                        index == 11
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
                    index = 12;
                  });
                },
                child: Container(
                  height: 56,
                  width: AppConstant.displayWidth(context),
                  decoration: BoxDecoration(
                      color: index == 12
                          ? ColorUtils.primaryOrangeShade5
                          : ColorUtils.greyShade1.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          Txt.questionOpt12Txt,
                          style: FontTextStyle.poppinsW5S14greyShade4,
                        ),
                        Spacer(),
                        index == 12
                            ? Icon(Icons.check_circle_rounded,
                                color: ColorUtils.primaryOrange)
                            : SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppConstant.size20),

              ///
              CustomButton(
                  title: Txt.nextTxt,
                  onPressed: () {
                    // widget.questions.questionOne = index.toString();
                    // print(
                    //     widget.questions.questionOne.toString() + "**********");
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) =>
                    //           SecondQuestionScreen(questions: widget.questions),
                    //     ));
                  }),
              SizedBox(height: AppConstant.size20),
            ],
          ),
        ),
      ),
    );
  }
}
