import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rewire/screens/authentication_screen/resetPassword_screen.dart';
import 'package:rewire/screens/bottom_navy_bar/bottom_navy_bar_screen.dart';
import 'package:rewire/screens/models/user_model.dart';
import 'package:rewire/services/profile_services.dart';
import 'package:rewire/utils/asset_paths.dart';
import 'package:rewire/utils/colors.dart';
import 'package:rewire/utils/constant.dart';
import 'package:rewire/utils/font_style_utils.dart';
import 'package:rewire/utils/strings.dart';
import 'package:rewire/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../provider/user_provider.dart';
import '../../widgets/custom_input_field.dart';
import '../../widgets/custom_loader.dart';
import '../plans_screen/allPlan_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _obscurePassword = false;
  bool isLoader = false;
  String? uid;

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    uid = prefs.getString('uid');
    setState(() {});
    print(uid.toString() + "********************");
  }

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
              padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Image(
                        image: AssetImage(appLogo), height: 50, width: 45),
                    const SizedBox(height: AppConstant.size10),
                    Text(Txt.signInTxt,
                        style: FontTextStyle.poppinsW5S24stromCloud),
                    const SizedBox(height: AppConstant.size35),
                    CustomInputField(
                      fieldController: email,
                      hint: "johndeo@gmail.com",
                      fieldName: Txt.usernameOrEmailTxt,
                      suffixIcon: Icon(
                        Icons.email_outlined,
                        color: ColorUtils.primaryOrange,
                      ),
                    ),
                    const SizedBox(height: AppConstant.size25),
                    CustomInputField(
                      fieldController: password,
                      obscureText: _obscurePassword,
                      hint: "********",
                      fieldName: Txt.passwordTxt,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        child: Icon(
                          _obscurePassword
                              ? Icons.visibility_off_outlined
                              : Icons.remove_red_eye_outlined,
                          color: ColorUtils.primaryOrange,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppConstant.size10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const ResetPasswordScreen(),
                              ),
                            );
                          },
                          child: Text(Txt.forgotPasswordTxt,
                              style: FontTextStyle.poppinsW4S12primaryOrange),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppConstant.size25),
                    CustomButton(
                      title: Txt.signInTxt,
                      onPressed: () async {
                        try {
                          setState(() {
                            isLoader = true;
                          });

                          await ProfileService()
                              .handleSignInEmail(email.text, password.text);

                          if (ProfileService().handleSignInEmail(
                                  email.text, password.text) !=
                              null) {
                            final QuerySnapshot querySnapshot =
                                await ProfileService()
                                    .checkUserByEmail(email.text);

                            await FirebaseFirestore.instance
                                .collection('users')
                                .where("email", isEqualTo: email.text)
                                .get()
                                .then(
                              (value) async {
                                final id = value.docs[0].id;

                                await FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(id)
                                    .update({
                                  'password': password.text,
                                });

                                await getData();
                              },
                            );
                          }

                          /*   Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const BottomNavigationScreen(),
                            ),
                          );*/
                        } on FirebaseAuthException catch (e) {
                          print(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("${e.message}")));
                          setState(() {
                            isLoader = false;
                          });
                        }
                        print(uid.toString() + "----->>");

                        ///checkPlan
                        await FirebaseFirestore.instance
                            .collection('users')
                            .doc(uid)
                            .get()
                            .then((value) {
                          print(value.data());
                          Map<String, dynamic> map =
                              value.data() as Map<String, dynamic>;
                          FirebaseUser firebaseUser =
                              FirebaseUser.fromJson(map);

                          DateTime currentDate = DateTime.parse(
                              firebaseUser.updateDate.toString());
                          DateTime expiryDate = DateTime.parse(
                              firebaseUser.expiryDate.toString());
                          bool planDate = expiryDate.isBefore(currentDate);

                          print(planDate.toString() + "------>> plan");
                          print(firebaseUser.updateDate.toString() +
                              "updateDate");
                          print(firebaseUser.expiryDate.toString() +
                              "expiryDate");
                          Provider.of<UserProvider>(context, listen: false)
                              .setUser(currentUser: firebaseUser);
                          if (planDate == true) {
                            setState(() {
                              isLoader = false;
                            });
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return AllPlanScreen(isSplash: true);
                              },
                            ), (route) => false);
                          } else {
                            setState(() {
                              isLoader = false;
                            });
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return const BottomNavigationScreen();
                              },
                            ), (route) => false);
                          }
                        });
                      },
                    ),
                    const SizedBox(height: AppConstant.size30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              color: ColorUtils.greyShade4,
                            ),
                          ),
                          Text(
                            Txt.continueWithTxt,
                            style: FontTextStyle.poppinsW4S12greyShade4,
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: ColorUtils.greyShade4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppConstant.size30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.all(8),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: ColorUtils.stromCloud1.withOpacity(0.05),
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: ColorUtils.stromCloud1)),
                          child: SvgPicture.asset(
                            appleLogo,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: ColorUtils.stromCloud1.withOpacity(0.05),
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: ColorUtils.stromCloud1)),
                          child: SvgPicture.asset(
                            googleLogo,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.all(8),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: ColorUtils.stromCloud1.withOpacity(0.05),
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: ColorUtils.stromCloud1)),
                          child: SvgPicture.asset(
                            facebookLogo,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        isLoader == true ? const CustomLoader() : const SizedBox.shrink()
      ],
    );
  }
}
