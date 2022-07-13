import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rewire/screens/profile_screen/addDebit_card_screen.dart';

import '../../utils/asset_paths.dart';
import '../../utils/colors.dart';
import '../../utils/constant.dart';
import '../../utils/font_style_utils.dart';
import '../../utils/strings.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_input_field.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({Key? key}) : super(key: key);

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(backgroundImage), fit: BoxFit.fill)),
      child: SafeArea(
        child: Scaffold(
            backgroundColor: ColorUtils.transparent,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_outlined,
                              color: ColorUtils.greyShade9,
                            ),
                          ),
                          SizedBox(width: AppConstant.size10),
                          Text(
                            Txt.cardDetailsTxt,
                            style: FontTextStyle.poppinsW5S20stromCloud,
                          )
                        ],
                      ),
                    ),
                    Text(
                      Txt.enterCardInfoTxt,
                      style: FontTextStyle.poppinsW4S16greyShade9,
                    ),
                    Container(
                      height: 185,
                      margin:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            debitCardImage,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppConstant.size10),
                    CustomInputField(
                      hint: "0000 0000 0000",
                      fieldName: Txt.cardNoTxt,
                      suffixIcon: Icon(
                        Icons.credit_card,
                        color: ColorUtils.greyShade7,
                      ),
                    ),
                    const SizedBox(height: AppConstant.size20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: AppConstant.displayWidth(context) * 0.4,
                          child: CustomInputField(
                            hint: "12/22",
                            fieldName: Txt.expireDateTxt,
                          ),
                        ),
                        Container(
                          width: AppConstant.displayWidth(context) * 0.4,
                          child: CustomInputField(
                            hint: "***",
                            fieldName: Txt.cvvTxt,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppConstant.size20),
                    CustomInputField(
                      hint: "Enter Name",
                      fieldName: Txt.cardHolderNameTxt,
                      suffixIcon: Icon(
                        Icons.person_outline,
                        color: ColorUtils.greyShade7,
                      ),
                    ),
                    const SizedBox(height: AppConstant.size20),
                    CustomButton(
                      title: "Save Card",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const AddDebitCardScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: AppConstant.size20),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
