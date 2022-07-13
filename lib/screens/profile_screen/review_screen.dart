import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rewire/screens/profile_screen/thankYou_screen.dart';
import 'package:rewire/utils/colors.dart';
import 'package:rewire/utils/constant.dart';
import 'package:rewire/utils/font_style_utils.dart';
import 'package:rewire/utils/strings.dart';
import 'package:rewire/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/auth_services.dart';
import '../../utils/asset_paths.dart';
import '../../widgets/custom_input_field.dart';
import '../../widgets/custom_loader.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  TextEditingController comment = TextEditingController();

  int starIndex = 1;
  int index = 0;
  bool isLoader = false;
  String? uid;
  @override
  void initState() {
    getUid();
    super.initState();
  }

  getUid() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    uid = pref.getString('uid') ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: ColorUtils.pastelBlue,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  margin: EdgeInsets.only(top: 50),
                  height: AppConstant.displayHeight(context),
                  width: AppConstant.displayWidth(context),
                  decoration: BoxDecoration(
                      color: ColorUtils.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(25))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(Icons.arrow_back_outlined)),
                          const SizedBox(width: AppConstant.size20),
                          Text(
                            Txt.reviewTxt,
                            textAlign: TextAlign.center,
                            style: FontTextStyle.poppinsW6S20greyShade9,
                          ),
                        ],
                      ),
                      SizedBox(height: AppConstant.size10),
                      Center(
                        child: Text(
                          Txt.reviewDesTxt,
                          style: FontTextStyle.poppinsW4S12greyShade6,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: AppConstant.size10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ...List.generate(
                              5,
                              (index) => IconButton(
                                    icon: index < starIndex
                                        ? Icon(
                                            Icons.star,
                                            size: 38,
                                            color: ColorUtils.primaryOrange,
                                          )
                                        : Icon(
                                            Icons.star,
                                            size: 38,
                                            color: ColorUtils.greyShade2,
                                          ),
                                    onPressed: () {
                                      setState(() {
                                        starIndex = index + 1;
                                      });
                                    },
                                  ))
                        ],
                      ),
                      SizedBox(height: AppConstant.size10),
                      Container(
                        height: 100,
                        width: AppConstant.displayWidth(context),
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(reviewImage),
                                fit: BoxFit.cover)),
                        child: Center(
                          child: Text(
                            starIndex == 1
                                ? "😶"
                                : starIndex == 2
                                    ? "🙂"
                                    : starIndex == 3
                                        ? "😊"
                                        : starIndex == 4
                                            ? "🤗"
                                            : starIndex == 5
                                                ? "🥰"
                                                : "😶",
                            style: const TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                      SizedBox(height: AppConstant.size10),
                      Text(
                        "Please select the type of feedback",
                        style: FontTextStyle.poppinsW5S16greyShade9,
                      ),
                      SizedBox(height: AppConstant.size15),
                      Column(
                        children: [
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                index = 1;
                              });
                            },
                            child: Container(
                              height: 37,
                              decoration: BoxDecoration(
                                  color: index == 1
                                      ? ColorUtils.primaryOrangeShade1
                                      : ColorUtils.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: index == 1
                                          ? ColorUtils.transparent
                                          : ColorUtils.stromCloud)),
                              child: Center(
                                child: Text(
                                  Txt.exactlyNeededTxt,
                                  style: index == 1
                                      ? FontTextStyle.poppinsW5S14white
                                      : FontTextStyle.poppinsW4S14stromCloud,
                                ),
                              ),
                            ),
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                index = 2;
                              });
                            },
                            child: Container(
                              height: 37,
                              decoration: BoxDecoration(
                                  color: index == 2
                                      ? ColorUtils.primaryOrangeShade1
                                      : ColorUtils.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: index == 2
                                          ? ColorUtils.transparent
                                          : ColorUtils.stromCloud)),
                              child: Center(
                                child: Text(
                                  Txt.thisExerciseHelpTxt,
                                  style: index == 2
                                      ? FontTextStyle.poppinsW5S14white
                                      : FontTextStyle.poppinsW4S14stromCloud,
                                ),
                              ),
                            ),
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                index = 3;
                              });
                            },
                            child: Container(
                              height: 37,
                              decoration: BoxDecoration(
                                  color: index == 3
                                      ? ColorUtils.primaryOrangeShade1
                                      : ColorUtils.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: index == 3
                                          ? ColorUtils.transparent
                                          : ColorUtils.stromCloud)),
                              child: Center(
                                child: Text(
                                  Txt.didntLikeTxt,
                                  style: index == 3
                                      ? FontTextStyle.poppinsW5S14white
                                      : FontTextStyle.poppinsW4S14stromCloud,
                                ),
                              ),
                            ),
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                index = 4;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              height: 37,
                              decoration: BoxDecoration(
                                  color: index == 4
                                      ? ColorUtils.primaryOrangeShade1
                                      : ColorUtils.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: index == 4
                                          ? ColorUtils.transparent
                                          : ColorUtils.stromCloud)),
                              child: Center(
                                child: Text(
                                  Txt.goodButNotLikeTxt,
                                  style: index == 4
                                      ? FontTextStyle.poppinsW5S14white
                                      : FontTextStyle.poppinsW4S14stromCloud,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppConstant.size10),
                      Divider(),
                      SizedBox(height: AppConstant.size20),
                      CustomInputField(
                        fieldController: comment,
                        fieldName: 'Comments',
                        maxLine: 3,
                        hint: "Type here...",
                      ),
                      SizedBox(height: AppConstant.size20),
                      CustomButton(
                        title: Txt.submitTxt,
                        onPressed: () async {
                          setState(() {
                            isLoader = true;
                          });
                          await AuthServices().feedback(
                              userId: uid,
                              rating: starIndex.toString(),
                              comments: comment.text,
                              type: index.toString());
                          setState(() {
                            isLoader = false;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ThankYouScreen(),
                              ));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        isLoader == true ? const CustomLoader() : const SizedBox.shrink(),
      ],
    );
  }
}
