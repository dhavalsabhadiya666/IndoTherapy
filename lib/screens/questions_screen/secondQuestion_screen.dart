import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rewire/screens/models/question_model.dart';
import 'package:rewire/screens/questions_screen/thirdQuestion_screen.dart';
import 'package:rewire/utils/colors.dart';
import 'package:rewire/utils/constant.dart';
import 'package:rewire/utils/font_style_utils.dart';
import 'package:rewire/utils/strings.dart';

import '../../utils/asset_paths.dart';
import '../../widgets/custom_button.dart';

class SecondQuestionScreen extends StatefulWidget {
  QuestionModel questions;
  SecondQuestionScreen({Key? key, required QuestionModel this.questions})
      : super(key: key);

  @override
  State<SecondQuestionScreen> createState() => _SecondQuestionScreenState();
}

class _SecondQuestionScreenState extends State<SecondQuestionScreen> {
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
              const SizedBox(height: AppConstant.size20),
              LinearProgressIndicator(
                value: 0.66,
                color: ColorUtils.primaryOrange,
                backgroundColor: ColorUtils.greyShade2,
              ),
              const SizedBox(height: AppConstant.size50),
              Text(
                Txt.question2Txt,
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
                          "Option 4",
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
              Spacer(),
              CustomButton(
                  title: Txt.nextTxt,
                  onPressed: () {
                    if (index != null) {
                      // widget.questions.questionTwo = index.toString();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ThirdQuestionScreen(
                                questions: widget.questions),
                          ));
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
