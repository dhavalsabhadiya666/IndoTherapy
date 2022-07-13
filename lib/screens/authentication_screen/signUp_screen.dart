import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:rewire/screens/models/question_model.dart';
import 'package:rewire/screens/plans_screen/allPlan_screen.dart';
import 'package:rewire/screens/plans_screen/showPlan_screen.dart';
import 'package:rewire/utils/asset_paths.dart';
import 'package:rewire/utils/colors.dart';
import 'package:rewire/utils/constant.dart';
import 'package:rewire/utils/font_style_utils.dart';
import 'package:rewire/utils/strings.dart';
import 'package:rewire/widgets/custom_button.dart';
import 'package:the_apple_sign_in/scope.dart';
import '../../services/apple_auth_service.dart';
import '../../services/apple_sign_in_available.dart';
import '../../services/fb_services.dart';
import '../../widgets/custom_input_field.dart';
import '../../widgets/custom_loader.dart';
import '../models/user_model.dart';

class SignUpScreen extends StatefulWidget {
  QuestionModel questions;
  SignUpScreen({Key? key, required QuestionModel this.questions})
      : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  FirebaseUser firebaseUser = FirebaseUser();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController firstName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  static FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoader = false;
  bool _obscurePassword = false;

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(em);
  }

  //Apple LogIn
  Future<void> _signInWithApple(BuildContext context) async {
    try {
      final authService = Provider.of<AuthServiceApple>(context, listen: false);
      /* final user =*/ await authService.signInWithApple(
          scopes: [Scope.email, Scope.fullName]).then((value) async {
        print('uid: ${value.uid}');
        setState(() {
          // emailcontroller.text = value.providerData[0].email!;
        });
        print('email------>: ${value.providerData[0].email}');
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final appleSignInAvailable1 =
        Provider.of<AppleSignInAvailable>(context, listen: false);

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
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Image(
                          image: AssetImage(appLogo), height: 50, width: 45),
                      const SizedBox(height: AppConstant.size10),
                      Text(Txt.signUpTxt,
                          style: FontTextStyle.poppinsW5S24stromCloud),
                      const SizedBox(height: AppConstant.size35),
                      CustomInputField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username is empty!";
                          }
                          return null;
                        },
                        fieldController: firstName,
                        hint: "John",
                        fieldName: Txt.firstNameTxt,
                        suffixIcon: Icon(
                          Icons.person_outline,
                          color: ColorUtils.primaryOrange,
                        ),
                      ),
                      const SizedBox(height: AppConstant.size25),
                      CustomInputField(
                        validator: (value) {
                          if (value == null || value == '') {
                            return 'please enter your email';
                          } else if (!isEmail(value)) {
                            return 'please enter valid email';
                          } else {
                            return null;
                          }
                        },
                        fieldController: email,
                        hint: "johndeo@gmail.com",
                        fieldName: Txt.emailTxt,
                        suffixIcon: Icon(
                          Icons.email_outlined,
                          color: ColorUtils.primaryOrange,
                        ),
                      ),
                      const SizedBox(height: AppConstant.size25),
                      CustomInputField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required";
                          } else if (value.length < 8) {
                            return "You must have 8 character in your password";
                          } else if (value.length > 15) {
                            return "You must less then 15 character in your Password";
                          }
                        },
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
                      const SizedBox(height: AppConstant.size25),
                      CustomButton(
                        title: Txt.createAccountTxt,
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            // final FirebaseAuth auth = FirebaseAuth.instance;
                            setState(() {
                              isLoader = true;
                            });

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AllPlanScreen(
                                    email: email.text,
                                    password: password.text,
                                    firstName: firstName.text,
                                    questions: widget.questions,
                                    user: firebaseUser,
                                    isSplash: false,
                                  ),
                                ));
                            setState(() {
                              isLoader = false;
                            });
                          }
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
                          if (appleSignInAvailable1.isAvailable)
                            CupertinoButton(
                              onPressed: () {
                                _signInWithApple(context);
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                padding: EdgeInsets.all(8),
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: ColorUtils.stromCloud1
                                        .withOpacity(0.05),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: ColorUtils.stromCloud1)),
                                child: SvgPicture.asset(
                                  appleLogo,
                                ),
                              ),
                            ),
                          CupertinoButton(
                            onPressed: () async {
                              await signInWithFacebook();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ShowPlanScreen(),
                                  ));
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              padding: EdgeInsets.all(8),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color:
                                      ColorUtils.stromCloud1.withOpacity(0.05),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: ColorUtils.stromCloud1)),
                              child: SvgPicture.asset(
                                facebookLogo,
                              ),
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
        ),
        isLoader == true ? CustomLoader() : SizedBox.shrink()
      ],
    );
  }
}
