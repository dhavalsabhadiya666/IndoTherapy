import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rewire/screens/authentication_screen/signIn_screen.dart';
import 'package:rewire/screens/models/user_model.dart';
import 'package:rewire/screens/plans_screen/showPlan_screen.dart';
import 'package:rewire/screens/profile_screen/aboutUs_screen.dart';
import 'package:rewire/screens/profile_screen/personal_details_screen.dart';
import 'package:rewire/screens/profile_screen/review_screen.dart';
import 'package:rewire/screens/profile_screen/termsCondition_screen.dart';
import 'package:rewire/utils/asset_paths.dart';
import 'package:rewire/utils/constant.dart';
import 'package:rewire/utils/font_style_utils.dart';
import 'package:rewire/utils/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/profile_services.dart';
import '../../utils/colors.dart';
import '../profile_screen/card_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  FirebaseUser? firebaseUser;

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? uid = await prefs.getString('uid');
    firebaseUser = await ProfileService().getUserById(id: uid);
    print(firebaseUser!.toJson().toString() + "+-*+-+-+-++-+-+-+-+-+");
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(profileBgImage), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: AppConstant.displayHeight(context) * 0.07),
                    margin: EdgeInsets.only(
                        top: AppConstant.displayHeight(context) * 0.22),
                    width: AppConstant.displayWidth(context),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25))),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              firebaseUser?.firstname ?? "",
                              style: FontTextStyle.poppinsW6S16stromCloud,
                            ),
                            SizedBox(width: AppConstant.size10),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        PersonalDetailsScreen(
                                      firebaseUser: firebaseUser,
                                    ),
                                  ),
                                ).then((value) => setState(() {}));
                              },
                              child: Icon(
                                Icons.create,
                                color: ColorUtils.primaryOrange,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: AppConstant.size10),
                        Text(
                          firebaseUser?.email ?? "",
                          style: FontTextStyle.poppinsW4S14greyShade6
                              .copyWith(color: ColorUtils.greyShade8),
                        ),
                        SizedBox(height: AppConstant.size20),
                        Container(
                          width: AppConstant.displayWidth(context),
                          decoration: BoxDecoration(
                              color: ColorUtils.white,
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(25))),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 16),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 16),
                                width: AppConstant.displayWidth(context),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              ColorUtils.grey.withOpacity(0.2),
                                          blurRadius: 5)
                                    ],
                                    borderRadius: BorderRadius.circular(16),
                                    color: ColorUtils.white),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Txt.completedCourseTxt,
                                      style:
                                          FontTextStyle.poppinsW6S16greyShade9,
                                    ),
                                    SizedBox(height: AppConstant.size10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: AppConstant.displayWidth(
                                                  context) *
                                              0.7,
                                          child: LinearProgressIndicator(
                                            value: 0.60,
                                            color: ColorUtils.stromCloud,
                                            backgroundColor:
                                                ColorUtils.stromCloud3,
                                          ),
                                        ),
                                        SizedBox(width: AppConstant.size5),
                                        Text(
                                          "60%",
                                          style: FontTextStyle
                                              .poppinsW5S12greyShade5
                                              .copyWith(
                                                  color: ColorUtils.greyShade9),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: AppConstant.size15,
                                    ),
                                    Image(
                                        image: AssetImage(nervousSystemImage)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 16),
                                          height: 115,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      dashBoardImage1))),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "02",
                                                      style: FontTextStyle
                                                          .poppinsW6S40greyShade9,
                                                    ),
                                                    SizedBox(
                                                        width:
                                                            AppConstant.size5),
                                                    Text(
                                                      "Hours",
                                                      style: FontTextStyle
                                                          .poppinsW4S16greyShade9,
                                                    )
                                                  ],
                                                ),
                                                Text(
                                                  "Total Time",
                                                  style: FontTextStyle
                                                      .poppinsW5S14greyShade8,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 16),
                                          height: 115,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      dashBoardImage2))),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "04",
                                                      style: FontTextStyle
                                                          .poppinsW6S40greyShade9,
                                                    ),
                                                    SizedBox(
                                                        width:
                                                            AppConstant.size5),
                                                    Text(
                                                      "Days",
                                                      style: FontTextStyle
                                                          .poppinsW4S16greyShade9,
                                                    )
                                                  ],
                                                ),
                                                Text(
                                                  "Daily Streak",
                                                  style: FontTextStyle
                                                      .poppinsW5S14greyShade8,
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
                        SizedBox(height: AppConstant.size10),
                        ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const CardScreen(),
                              ),
                            );
                          },
                          leading: SvgPicture.asset(
                            paymentIcon,
                          ),
                          title: Text(
                            Txt.paymentMethodTxt,
                            style: FontTextStyle.poppinsW6S16greyShade9,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ShowPlanScreen(),
                              ),
                            );
                          },
                          leading: SvgPicture.asset(
                            subscriptionIcon,
                          ),
                          title: Text(
                            Txt.subscriptionTxt,
                            style: FontTextStyle.poppinsW6S16greyShade9,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const TermsConditionScreen(),
                              ),
                            );
                          },
                          leading: SvgPicture.asset(
                            termsConditionIcon,
                          ),
                          title: Text(
                            Txt.termsConditionTxt,
                            style: FontTextStyle.poppinsW6S16greyShade9,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const AboutUsScreen(),
                              ),
                            );
                          },
                          leading: SvgPicture.asset(
                            aboutUsIcon,
                          ),
                          title: Text(
                            Txt.aboutUsTxt,
                            style: FontTextStyle.poppinsW6S16greyShade9,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const ReviewScreen(),
                              ),
                            );
                          },
                          leading: SvgPicture.asset(
                            reviewIcon,
                          ),
                          title: Text(
                            Txt.reviewsFeedbackTxt,
                            style: FontTextStyle.poppinsW6S16greyShade9,
                          ),
                        ),
                        ListTile(
                          onTap: () async {
                            SharedPreferences pref =
                                await SharedPreferences.getInstance();
                            pref.remove('uid');
                            Navigator.pushAndRemoveUntil(context,
                                CupertinoPageRoute(builder: (context) {
                              return SignInScreen();
                            }), (route) => false);
                          },
                          leading: SvgPicture.asset(
                            logOutIcon,
                          ),
                          title: Text(
                            Txt.logoutTxt,
                            style: FontTextStyle.poppinsW6S16greyShade9,
                          ),
                        ),
                        SizedBox(height: AppConstant.size20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                height: 1,
                                color: ColorUtils.greyShade1,
                              ),
                            ),
                            Text(
                              " Join the community ",
                              style: FontTextStyle.poppinsW4S12greyShade6,
                            ),
                            Expanded(
                              child: Container(
                                height: 1,
                                color: ColorUtils.greyShade1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppConstant.size10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: ColorUtils.stromCloud1),
                                  image: DecorationImage(
                                      image: AssetImage(instagramLogo))),
                            ),
                            SizedBox(width: AppConstant.size10),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: ColorUtils.stromCloud1),
                                  image: const DecorationImage(
                                      image: AssetImage(facebookIcon))),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppConstant.size30),
                      ],
                    ),
                  ),
                  Positioned(
                      top: AppConstant.displayHeight(context) * 0.17,
                      left: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage(firebaseUser
                                ?.profilePic ??
                            "https://w0.peakpx.com/wallpaper/138/911/HD-wallpaper-virat-kohli-cartoon-india-vector-illustration.jpg"),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
