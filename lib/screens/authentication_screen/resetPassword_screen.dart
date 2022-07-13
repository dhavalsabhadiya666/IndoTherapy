import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rewire/screens/authentication_screen/signIn_screen.dart';
import 'package:rewire/utils/asset_paths.dart';
import 'package:rewire/utils/colors.dart';
import 'package:rewire/utils/constant.dart';
import 'package:rewire/utils/font_style_utils.dart';
import 'package:rewire/utils/strings.dart';
import 'package:rewire/widgets/custom_button.dart';

import '../../widgets/custom_input_field.dart';
import 'createNewPassword_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();

  bool loader = false;

  forgotPasswordData() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Password Reset email has been sent!")));
      setState(() {
        loader = false;
      });
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SignInScreen()));
    } on FirebaseAuthException catch (e) {
      print(e);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("${e.message}")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(backgroundImage))),
      child: Scaffold(
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
                  Text(Txt.resetPasswordTxt,
                      style: FontTextStyle.poppinsW5S24stromCloud),
                  const SizedBox(height: AppConstant.size35),
                  CustomInputField(
                    fieldController: email,
                    hint: "johndeo@gmail.com",
                    fieldName: Txt.emailTxt,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username is empty!";
                      }
                      return null;
                    },
                    suffixIcon: Icon(
                      Icons.email_outlined,
                      color: ColorUtils.primaryOrange,
                    ),
                  ),
                  const SizedBox(height: AppConstant.size25),
                  CustomButton(
                    title: Txt.submitTxt,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          loader = true;
                          email.text;
                        });
                        forgotPasswordData();
                      }
                      print("Forgot successful**********");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateNewPasswordScreen(),
                          ));
                    },
                  ),
                  const SizedBox(height: AppConstant.size30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
