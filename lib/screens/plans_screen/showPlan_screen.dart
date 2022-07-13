import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rewire/screens/bottom_navy_bar/bottom_navy_bar_screen.dart';
import 'package:rewire/screens/models/question_model.dart';
import 'package:rewire/screens/models/user_model.dart';
import 'package:rewire/services/profile_services.dart';
import 'package:rewire/utils/asset_paths.dart';
import 'package:rewire/utils/colors.dart';
import 'package:rewire/utils/constant.dart';
import 'package:rewire/utils/font_style_utils.dart';
import 'package:rewire/utils/strings.dart';
import 'package:rewire/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/auth_services.dart';
import '../../widgets/custom_input_field.dart';
import '../../widgets/custom_loader.dart';
import '../payment_screen/stripe_screen.dart';

class ShowPlanScreen extends StatefulWidget {
  String? firstName;
  String? email;
  String? password;
  FirebaseUser? user;
  QuestionModel? questionModel;
  double? amount;
  String? plan;
  bool? isSplash;
  ShowPlanScreen(
      {Key? key,
      this.firstName,
      this.email,
      this.password,
      this.user,
      this.questionModel,
      this.amount,
      this.plan,
      this.isSplash})
      : super(key: key);

  @override
  State<ShowPlanScreen> createState() => _ShowPlanScreenState();
}

class _ShowPlanScreenState extends State<ShowPlanScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController cardNo = TextEditingController();
  TextEditingController expiryDate = TextEditingController();
  TextEditingController cvv = TextEditingController();
  TextEditingController holderName = TextEditingController();

  bool isLoader = false;

  ApiresponseModel? apiresponseModel;

  FirebaseUser? firebaseUser;
  String? uid;

  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    uid = await prefs.getString('uid');
    firebaseUser = await ProfileService().getUserById(id: uid);
    print(firebaseUser!.toJson().toString() + "+-*+-+-+-++-+-+-+-+-+");
    setState(() {});
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: ColorUtils.pastelBlue,
          body: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Image(
                        image: AssetImage(frameLogo),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(profileLogo),
                        ),
                        Icon(
                          Icons.notifications_none_outlined,
                          color: ColorUtils.stromCloud,
                        )
                      ],
                    ),
                    const SizedBox(height: AppConstant.size10),
                    Text(
                      "Hi Smith",
                      style: FontTextStyle.poppinsW7S30stromCloud,
                    ),
                    const SizedBox(height: AppConstant.size5),
                    Text(
                      Txt.smileTxt,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: ColorUtils.stromCloud,
                          fontSize: 15,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.7,
                maxChildSize: 0.83,
                minChildSize: 0.68,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    width: AppConstant.displayWidth(context),
                    decoration: BoxDecoration(
                        color: ColorUtils.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30))),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                margin: EdgeInsets.all(7),
                                height: 5,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: ColorUtils.greyShade2,
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                            Text(
                              Txt.finalStepTxt,
                              style: FontTextStyle.poppinsW5S20stromCloud,
                            ),
                            const SizedBox(height: AppConstant.size5),
                            Divider(),
                            const SizedBox(height: AppConstant.size5),
                            Row(
                              children: [
                                Image(
                                  image: AssetImage(appLogo),
                                  height: 50,
                                  width: 50,
                                ),
                                const SizedBox(width: AppConstant.size10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Txt.freeForTxt,
                                      style:
                                          FontTextStyle.poppinsW5S14greyShade8,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${widget.amount}",
                                          style: FontTextStyle
                                              .poppinsW5S16greyShade9,
                                        ),
                                        const Text("/"),
                                        Text(
                                          widget.plan.toString(),
                                          style: FontTextStyle
                                              .poppinsW4S12greyShade4,
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: AppConstant.size10),
                            Row(
                              children: [
                                Text(
                                  widget.plan.toString(),
                                  style: FontTextStyle.poppinsW5S18labelColor,
                                ),
                                Text(
                                  Txt.membershipTxt,
                                  style: FontTextStyle.poppinsW5S18labelColor,
                                ),
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
                            const SizedBox(height: AppConstant.size15),
                            Text(
                              Txt.selectCardTxt,
                              style: FontTextStyle.poppinsW5S18labelColor,
                            ),
                            const SizedBox(height: AppConstant.size10),
                            CustomInputField(
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                CustomInputFormatter(),
                                LengthLimitingTextInputFormatter(19)
                              ],
                              fieldInputType: TextInputType.number,
                              fieldController: cardNo,
                              hint: "0000 0000 0000",
                              fieldName: Txt.cardNoTxt,
                              suffixIcon: Icon(
                                Icons.credit_card,
                                color: ColorUtils.greyShade7,
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Required";
                                }
                              },
                            ),
                            const SizedBox(height: AppConstant.size15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width:
                                      AppConstant.displayWidth(context) * 0.4,
                                  child: CustomInputField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      CardExpirationFormatter(),
                                      LengthLimitingTextInputFormatter(7)
                                    ],
                                    fieldInputType: TextInputType.number,
                                    fieldController: expiryDate,
                                    hint: "12/22",
                                    fieldName: Txt.expireDateTxt,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Required";
                                      }
                                    },
                                  ),
                                ),
                                Container(
                                  width:
                                      AppConstant.displayWidth(context) * 0.4,
                                  child: CustomInputField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(3)
                                    ],
                                    fieldInputType: TextInputType.number,
                                    fieldController: cvv,
                                    hint: "***",
                                    fieldName: Txt.cvvTxt,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Required";
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: AppConstant.size15),
                            CustomInputField(
                              fieldController: holderName,
                              hint: "Enter Name",
                              fieldName: Txt.cardHolderNameTxt,
                              suffixIcon: Icon(
                                Icons.person_outline,
                                color: ColorUtils.greyShade7,
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Required";
                                }
                              },
                            ),
                            const SizedBox(height: AppConstant.size15),
                            CustomButton(
                              title: Txt.continueTxt,
                              onPressed: () async {
                                final FirebaseAuth auth = FirebaseAuth.instance;

                                if (widget.isSplash ?? false) {
                                  if (formKey.currentState!.validate()) {
                                    setState(() {
                                      isLoader = true;
                                    });

                                    apiresponseModel = await StripeApiProvider()
                                        .creartSecondCard(
                                      amount: widget.amount!,
                                      expireDate: expiryDate.text,
                                      email: firebaseUser?.email,
                                      address: '',
                                      cvcNumber: cvv.text,
                                      // firebaseUser?.cardDetails?["cvv"],
                                      cardNumber: cardNo.text,
                                      context: context,
                                    );

                                    if (apiresponseModel?.statusCode == 200) {
                                      await ProfileService().updateUser(
                                          firebaseUser,
                                          uid,
                                          DateTime.now().toString(),
                                          widget.plan,
                                          cardDetails: {
                                            "card_no": cardNo.text,
                                            "expiry_date": expiryDate.text,
                                            "cvv": cvv.text,
                                            "card_holder_name": holderName.text,
                                          });
                                    }

                                    setState(() {
                                      isLoader = false;
                                    });

                                    Navigator.pushAndRemoveUntil(context,
                                        MaterialPageRoute(
                                      builder: (context) {
                                        return const BottomNavigationScreen();
                                      },
                                    ), (route) => false);

                                    ///update expiry
                                  }
                                } else {
                                  bool status = await ProfileService()
                                      .checkIfEmailInUse(
                                          widget.email.toString());
                                  if (formKey.currentState!.validate()) {
                                    setState(() {
                                      isLoader = true;
                                    });
                                    if (status == false) {
                                      apiresponseModel =
                                          await StripeApiProvider()
                                              .creartSecondCard(
                                        amount: widget.amount!,
                                        expireDate: expiryDate.text,
                                        email: widget.email.toString(),
                                        address: '',
                                        cvcNumber: cvv.text,
                                        cardNumber: cardNo.text,
                                        context: context,
                                      );

                                      if (apiresponseModel?.statusCode == 200) {
                                        setState(() {
                                          isLoader = true;
                                        });
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
                                            password:
                                                widget.password.toString(),
                                            /*questionOne: widget
                                                .questionModel?.questionOne
                                                .toString(),
                                            questionTwo: widget
                                                .questionModel?.questionTwo
                                                .toString(),
                                            questionThree: widget
                                                .questionModel?.questionThree
                                                .toString(),*/
                                            questionFour: widget
                                                .questionModel?.questionFour
                                                .toString(),
                                            is_blocked: widget.user?.isBlocked,
                                            uid: user.uid,
                                            plan: widget.plan,
                                            updateDate:
                                                DateTime.now().toString(),
                                            cardDetails: {
                                              "card_no": cardNo.text,
                                              "expiry_date": expiryDate.text,
                                              "cvv": cvv.text,
                                              "card_holder_name":
                                                  holderName.text,
                                            });

                                        setState(() {
                                          isLoader = false;
                                        });
                                        Navigator.pushAndRemoveUntil(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return const BottomNavigationScreen();
                                          },
                                        ), (route) => false);
                                      } else {
                                        setState(() {
                                          isLoader = false;
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    "${apiresponseModel?.data["error"]["message"]}")));
                                      }
                                    } else {
                                      setState(() {
                                        isLoader = false;
                                      });
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "Email is already registered")));
                                    }
                                  }
                                }
                              },
                            ),
                            const SizedBox(height: AppConstant.size15),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        isLoader == true ? CustomLoader() : SizedBox.shrink()
      ],
    );
  }
}

class CustomInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = new StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write(
            '-'); // Replace this with anything you want to put after each 4 numbers
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: new TextSelection.collapsed(offset: string.length));
  }
}

class CardExpirationFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newValueString = newValue.text;
    String valueToReturn = '';

    for (int i = 0; i < newValueString.length; i++) {
      if (newValueString[i] != '/') valueToReturn += newValueString[i];
      var nonZeroIndex = i + 1;
      final contains = valueToReturn.contains(RegExp(r'\/'));
      if (nonZeroIndex % 2 == 0 &&
          nonZeroIndex != newValueString.length &&
          !(contains)) {
        valueToReturn += '/';
      }
    }
    return newValue.copyWith(
      text: valueToReturn,
      selection: TextSelection.fromPosition(
        TextPosition(offset: valueToReturn.length),
      ),
    );
  }
}
