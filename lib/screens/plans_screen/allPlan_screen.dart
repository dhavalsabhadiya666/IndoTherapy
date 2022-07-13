import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rewire/screens/bottom_navy_bar/bottom_navy_bar_screen.dart';
import 'package:rewire/screens/models/question_model.dart';
import 'package:rewire/screens/models/user_model.dart';
import 'package:rewire/screens/plans_screen/showPlan_screen.dart';
import 'package:rewire/services/auth_services.dart';
import 'package:rewire/services/profile_services.dart';
import 'package:rewire/utils/colors.dart';
import 'package:rewire/utils/constant.dart';
import 'package:rewire/utils/font_style_utils.dart';
import 'package:rewire/utils/strings.dart';
import 'package:rewire/widgets/custom_button.dart';
import '../../widgets/custom_loader.dart';

class AllPlanScreen extends StatefulWidget {
  String? firstName;
  String? password;
  String? email;
  QuestionModel? questions;
  FirebaseUser? user;
  bool? isSplash;
  AllPlanScreen(
      {Key? key,
      this.user,
      this.email,
      this.password,
      this.firstName,
      this.questions,
      this.isSplash})
      : super(key: key);

  @override
  State<AllPlanScreen> createState() => _AllPlanScreenState();
}

class _AllPlanScreenState extends State<AllPlanScreen> {
  // var uid;

  // getSharedPreferences() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   uid = preferences.getString("uid");
  // }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoader = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          Txt.pickYourMembershipTxt,
                          style: FontTextStyle.poppinsW5S20stromCloud,
                        ),
                        Spacer(),
                        Icon(
                          Icons.close,
                          color: ColorUtils.greyShade9,
                        )
                      ],
                    ),
                    SizedBox(height: AppConstant.size30),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
                      decoration: BoxDecoration(
                          color: ColorUtils.stromCloud6,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: ColorUtils.stromCloud2)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                Txt.yearlyTxt,
                                style: FontTextStyle.poppinsW7S20stromCloud,
                              ),
                              Spacer(),
                              Container(
                                height: 42,
                                width: 120,
                                decoration: BoxDecoration(
                                    color: ColorUtils.stromCloud,
                                    borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(10))),
                                child: Center(
                                  child: Text(
                                    "RECOMMENDED",
                                    style: FontTextStyle.poppinsW5S12white,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: AppConstant.size10),
                          Row(
                            children: [
                              Text(
                                "\$59.99",
                                style: FontTextStyle.poppinsW6S32greyShade9,
                              ),
                              Text(
                                "/year",
                                style: FontTextStyle.poppinsW5S12greyShade5,
                              )
                            ],
                          ),
                          Text(
                            Txt.freeForTxt,
                            style: FontTextStyle.poppinsW4S12greyShade6,
                          ),
                          const SizedBox(height: AppConstant.size20),
                          Row(
                            children: [
                              Icon(
                                Icons.brightness_1_rounded,
                                size: 10,
                                color: ColorUtils.pastelBlue,
                              ),
                              const SizedBox(
                                width: AppConstant.size15,
                              ),
                              Expanded(
                                child: Text(
                                  Txt.goldPlanDes1Txt,
                                  style: FontTextStyle.poppinsW4S12greyShade9,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: AppConstant.size10),
                          Row(
                            children: [
                              Icon(
                                Icons.brightness_1_rounded,
                                size: 10,
                                color: ColorUtils.pastelBlue,
                              ),
                              const SizedBox(
                                width: AppConstant.size15,
                              ),
                              Expanded(
                                child: Text(
                                  Txt.goldPlanDes2Txt,
                                  style: FontTextStyle.poppinsW4S12greyShade9,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: AppConstant.size10),
                          Row(
                            children: [
                              Icon(
                                Icons.brightness_1_rounded,
                                size: 10,
                                color: ColorUtils.pastelBlue,
                              ),
                              const SizedBox(
                                width: AppConstant.size15,
                              ),
                              Text(
                                Txt.goldPlanDes3Txt,
                                style: FontTextStyle.poppinsW4S12greyShade9,
                              )
                            ],
                          ),
                          const SizedBox(height: AppConstant.size10),
                          Row(
                            children: [
                              Icon(
                                Icons.brightness_1_rounded,
                                size: 10,
                                color: ColorUtils.pastelBlue,
                              ),
                              const SizedBox(
                                width: AppConstant.size15,
                              ),
                              Text(
                                Txt.goldPlanDes4Txt,
                                style: FontTextStyle.poppinsW4S12greyShade9,
                              )
                            ],
                          ),
                          const SizedBox(height: AppConstant.size10),
                          Row(
                            children: [
                              Icon(
                                Icons.brightness_1_rounded,
                                size: 10,
                                color: ColorUtils.pastelBlue,
                              ),
                              const SizedBox(
                                width: AppConstant.size15,
                              ),
                              Text(
                                Txt.goldPlanDes5Txt,
                                style: FontTextStyle.poppinsW4S12greyShade9,
                              )
                            ],
                          ),
                          const SizedBox(height: AppConstant.size25),
                          CustomButton(
                            title: Txt.continueTxt,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ShowPlanScreen(
                                    firstName: widget.firstName,
                                    email: widget.email,
                                    password: widget.password,
                                    user: widget.user,
                                    questionModel: widget.questions,
                                    amount: 59.99,
                                    plan: "Yearly",
                                    isSplash: widget.isSplash,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppConstant.size20),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 25),
                      decoration: BoxDecoration(
                          color: ColorUtils.stromCloud6.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: ColorUtils.stromCloud2)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Txt.monthlyTxt,
                            style: FontTextStyle.poppinsW7S20stromCloud,
                          ),
                          const SizedBox(height: AppConstant.size10),
                          Row(
                            children: [
                              Text(
                                "\$11.99",
                                style: FontTextStyle.poppinsW6S32greyShade9,
                              ),
                              Text(
                                "/Month",
                                style: FontTextStyle.poppinsW5S12greyShade5,
                              )
                            ],
                          ),
                          Text(
                            Txt.freeFor7Txt,
                            style: FontTextStyle.poppinsW4S12greyShade6,
                          ),
                          const SizedBox(height: AppConstant.size20),
                          Row(
                            children: [
                              Icon(
                                Icons.brightness_1_rounded,
                                size: 10,
                                color: ColorUtils.pastelBlue,
                              ),
                              const SizedBox(
                                width: AppConstant.size15,
                              ),
                              Expanded(
                                child: Text(
                                  Txt.goldPlanDes1Txt,
                                  style: FontTextStyle.poppinsW4S12greyShade9,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: AppConstant.size10),
                          Row(
                            children: [
                              Icon(
                                Icons.brightness_1_rounded,
                                size: 10,
                                color: ColorUtils.pastelBlue,
                              ),
                              const SizedBox(
                                width: AppConstant.size15,
                              ),
                              Expanded(
                                child: Text(
                                  Txt.goldPlanDes2Txt,
                                  style: FontTextStyle.poppinsW4S12greyShade9,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: AppConstant.size10),
                          Row(
                            children: [
                              Icon(
                                Icons.brightness_1_rounded,
                                size: 10,
                                color: ColorUtils.pastelBlue,
                              ),
                              const SizedBox(
                                width: AppConstant.size15,
                              ),
                              Text(
                                Txt.goldPlanDes3Txt,
                                style: FontTextStyle.poppinsW4S12greyShade9,
                              )
                            ],
                          ),
                          const SizedBox(height: AppConstant.size10),
                          Row(
                            children: [
                              Icon(
                                Icons.brightness_1_rounded,
                                size: 10,
                                color: ColorUtils.pastelBlue,
                              ),
                              const SizedBox(
                                width: AppConstant.size15,
                              ),
                              Text(
                                Txt.goldPlanDes4Txt,
                                style: FontTextStyle.poppinsW4S12greyShade9,
                              )
                            ],
                          ),
                          const SizedBox(height: AppConstant.size10),
                          Row(
                            children: [
                              Icon(
                                Icons.brightness_1_rounded,
                                size: 10,
                                color: ColorUtils.pastelBlue,
                              ),
                              const SizedBox(
                                width: AppConstant.size15,
                              ),
                              Text(
                                Txt.goldPlanDes5Txt,
                                style: FontTextStyle.poppinsW4S12greyShade9,
                              )
                            ],
                          ),
                          const SizedBox(height: AppConstant.size25),
                          CupertinoButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ShowPlanScreen(
                                    firstName: widget.firstName,
                                    email: widget.email,
                                    password: widget.password,
                                    user: widget.user,
                                    questionModel: widget.questions,
                                    amount: 11.99,
                                    plan: "Monthly",
                                    isSplash: widget.isSplash,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: AppConstant.displayWidth(context),
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorUtils.primaryOrange),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  Txt.continueTxt,
                                  style:
                                      FontTextStyle.poppinsW5S16primaryOrange,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: AppConstant.size20),
                    widget.isSplash ?? false
                        ? SizedBox()
                        : Container(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 25),
                            decoration: BoxDecoration(
                                color: ColorUtils.stromCloud6.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: ColorUtils.stromCloud2)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Txt.freeTrailTxt,
                                  style: FontTextStyle.poppinsW7S20stromCloud,
                                ),
                                const SizedBox(height: AppConstant.size10),
                                Text(
                                  "Free ",
                                  style: FontTextStyle.poppinsW6S32greyShade9,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.brightness_1_rounded,
                                      size: 10,
                                      color: ColorUtils.pastelBlue,
                                    ),
                                    const SizedBox(
                                      width: AppConstant.size15,
                                    ),
                                    Expanded(
                                      child: Text(
                                        Txt.freeTrialDes1Txt,
                                        style: FontTextStyle
                                            .poppinsW4S12greyShade9,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: AppConstant.size10),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.brightness_1_rounded,
                                      size: 10,
                                      color: ColorUtils.pastelBlue,
                                    ),
                                    const SizedBox(
                                      width: AppConstant.size15,
                                    ),
                                    Expanded(
                                      child: Text(
                                        Txt.freeTrialDes2Txt,
                                        style: FontTextStyle
                                            .poppinsW4S12greyShade9,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: AppConstant.size10),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.brightness_1_rounded,
                                      size: 10,
                                      color: ColorUtils.pastelBlue,
                                    ),
                                    const SizedBox(
                                      width: AppConstant.size15,
                                    ),
                                    Text(
                                      Txt.freeTrialDes3Txt,
                                      style:
                                          FontTextStyle.poppinsW4S12greyShade9,
                                    )
                                  ],
                                ),
                                const SizedBox(height: AppConstant.size10),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.brightness_1_rounded,
                                      size: 10,
                                      color: ColorUtils.pastelBlue,
                                    ),
                                    const SizedBox(
                                      width: AppConstant.size15,
                                    ),
                                    Text(
                                      Txt.freeTrialDes4Txt,
                                      style:
                                          FontTextStyle.poppinsW4S12greyShade9,
                                    )
                                  ],
                                ),
                                const SizedBox(height: AppConstant.size10),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.brightness_1_rounded,
                                      size: 10,
                                      color: ColorUtils.pastelBlue,
                                    ),
                                    const SizedBox(
                                      width: AppConstant.size15,
                                    ),
                                    Text(
                                      Txt.freeTrialDes5Txt,
                                      style:
                                          FontTextStyle.poppinsW4S12greyShade9,
                                    )
                                  ],
                                ),
                                const SizedBox(height: AppConstant.size25),
                                CupertinoButton(
                                  onPressed: () async {
                                    final FirebaseAuth auth =
                                        FirebaseAuth.instance;
                                    setState(() {
                                      isLoader = true;
                                    });
                                    if (widget.isSplash ?? false) {
                                      ///
                                    } else {
                                      bool status = await ProfileService()
                                          .checkIfEmailInUse(
                                              widget.email.toString());
                                      if (status == false) {
                                        Future<User> handleSignUp(
                                            email, password) async {
                                          UserCredential result = await auth
                                              .createUserWithEmailAndPassword(
                                                  email:
                                                      widget.email.toString(),
                                                  password: widget.password
                                                      .toString());
                                          final User user = result.user!;

                                          return user;
                                        }

                                        User user = await handleSignUp(
                                            widget.email.toString(),
                                            widget.password.toString());
                                        await AuthServices().saveUser(
                                          context: context,
                                          firstName:
                                              widget.firstName.toString(),
                                          email: widget.email.toString(),
                                          password: widget.password.toString(),
                                          /*questionOne: widget
                                              .questions?.questionOne
                                              .toString(),
                                          questionTwo: widget
                                              .questions?.questionTwo
                                              .toString(),
                                          questionThree: widget
                                              .questions?.questionThree
                                              .toString(),*/
                                          questionFour: widget
                                              .questions?.questionFour
                                              .toString(),
                                          is_blocked: widget.user?.isBlocked,
                                          uid: user.uid,
                                          plan: "Free Trial",
                                          updateDate: DateTime.now().toString(),
                                        );

                                        setState(() {
                                          isLoader = false;
                                        });
                                        // widget.user.plan = 'Yearly';
                                        // await ProfileService().updateUser(uid, "Yearly");
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                const BottomNavigationScreen(),
                                          ),
                                        );
                                      }
                                    }
                                  },
                                  child: Container(
                                    width: AppConstant.displayWidth(context),
                                    height: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ColorUtils.primaryOrange),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(
                                        Txt.continueTxt,
                                        style: FontTextStyle
                                            .poppinsW5S16primaryOrange,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
        isLoader == true ? CustomLoader() : SizedBox.shrink()
      ],
    );
  }
}
