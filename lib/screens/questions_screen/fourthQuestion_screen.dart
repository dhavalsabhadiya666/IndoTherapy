import 'package:flutter/material.dart';
import 'package:rewire/screens/authentication_screen/signUp_screen.dart';
import 'package:rewire/screens/models/question_model.dart';
import 'package:rewire/screens/plans_screen/allPlan_screen.dart';
import 'package:rewire/screens/questions_screen/firstQuestion_screen.dart';
import 'package:rewire/utils/colors.dart';
import 'package:rewire/utils/constant.dart';
import 'package:rewire/utils/font_style_utils.dart';
import 'package:rewire/utils/strings.dart';
import '../../utils/asset_paths.dart';
import '../../widgets/custom_button.dart';

class FourthQuestionScreen extends StatefulWidget {
  const FourthQuestionScreen({Key? key}) : super(key: key);

  @override
  State<FourthQuestionScreen> createState() => _FourthQuestionScreen();
}

class _FourthQuestionScreen extends State<FourthQuestionScreen> {
  QuestionModel questionModel = QuestionModel();
  List<QuestionModel> questionModelList = [
    QuestionModel(
      image: questionImage1,
      type: Txt.question4Opt1Txt,
    ),
    QuestionModel(
      image: questionImage2,
      type: Txt.question4Opt2Txt,
    ),
    QuestionModel(
      image: questionImage3,
      type: Txt.question4Opt3Txt,
    ),
    QuestionModel(
      image: questionImage4,
      type: Txt.question4Opt4Txt,
    ),
    QuestionModel(
      image: questionImage5,
      type: Txt.question4Opt5Txt,
    ),
    QuestionModel(
      image: questionImage6,
      type: Txt.question4Opt6Txt,
    ),
    QuestionModel(
      image: questionImage7,
      type: Txt.question4Opt7Txt,
    ),
    QuestionModel(
      image: questionImage8,
      type: Txt.question4Opt8Txt,
    ),
    QuestionModel(
      image: questionImage9,
      type: Txt.question4Opt9Txt,
    ),
    QuestionModel(
      image: questionImage10,
      type: Txt.question4Opt10Txt,
    ),
    QuestionModel(
      image: questionImage11,
      type: Txt.question4Opt11Txt,
    ),
  ];

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
              const SizedBox(height: AppConstant.size70),
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
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      Txt.skipTxt,
                      style: FontTextStyle.poppinsW5S16primaryOrange,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppConstant.size20),
              LinearProgressIndicator(
                value: 0.33,
                color: ColorUtils.primaryOrange,
                backgroundColor: ColorUtils.greyShade2,
              ),
              const SizedBox(height: AppConstant.size50),
              Text(
                Txt.question1Txt,
                style: FontTextStyle.poppinsW7S24greyShade7,
              ),
              const SizedBox(height: AppConstant.size20),
              Text(
                Txt.selectOptionsTxt,
                style: FontTextStyle.poppinsW7S16grayShade5,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: questionModelList.length,
                itemBuilder: (context, index) => GestureDetector(
                  // padding: EdgeInsets.zero,
                  onTap: () {
                    setState(() {
                      questionModelList[index].isSelected =
                          !(questionModelList[index].isSelected ?? false);
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.all(14),
                    height: 120,
                    width: AppConstant.displayWidth(context),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                questionModelList[index].image.toString()),
                            fit: BoxFit.fitWidth)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        questionModelList[index].isSelected == true
                            ? Align(
                                alignment: Alignment.topRight,
                                child: Icon(
                                  Icons.check_circle_rounded,
                                  color: ColorUtils.primaryOrange,
                                ),
                              )
                            : const SizedBox(),
                        const Spacer(),
                        Text(
                          questionModelList[index].type.toString(),
                          style: FontTextStyle.poppinsW5S14white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppConstant.size20),

              ///
              CustomButton(
                  title: Txt.nextTxt,
                  onPressed: () {
                    List<String?>? selected = [];
                    for (int i = 0; i < questionModelList.length; i++) {
                      if (questionModelList[i].isSelected == true) {
                        selected.add(questionModelList[i].type);
                      }
                    }

                    questionModel.questionFour = selected.cast<String>();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SignUpScreen(questions: questionModel),
                        ));
                  }),
              const SizedBox(height: AppConstant.size20),
            ],
          ),
        ),
      ),
    );
  }
}
