import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rewire/screens/bottom_navy_bar/bottom_navy_bar_screen.dart';
import 'package:rewire/utils/asset_paths.dart';
import 'package:rewire/utils/colors.dart';
import 'package:rewire/utils/constant.dart';
import 'package:rewire/utils/font_style_utils.dart';
import 'package:rewire/utils/strings.dart';
import 'package:rewire/widgets/custom_button.dart';

import '../../widgets/custom_input_field.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(backgroundImage))),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Image(image: AssetImage(appLogo), height: 50, width: 45),
                const SizedBox(height: AppConstant.size10),
                Text("Create New Password",
                    style: FontTextStyle.poppinsW5S24stromCloud),
                const SizedBox(height: AppConstant.size35),
                CustomInputField(
                  hint: "********",
                  fieldName: Txt.newPasswordTxt,
                  suffixIcon: Icon(
                    Icons.remove_red_eye_outlined,
                    color: ColorUtils.primaryOrange,
                  ),
                ),
                const SizedBox(height: AppConstant.size25),
                CustomInputField(
                  hint: "********",
                  fieldName: Txt.confirmNewPasswordTxt,
                  suffixIcon: Icon(
                    Icons.remove_red_eye_outlined,
                    color: ColorUtils.primaryOrange,
                  ),
                ),
                const SizedBox(height: AppConstant.size25),
                CustomButton(
                  title: Txt.resetTxt,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const BottomNavigationScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
