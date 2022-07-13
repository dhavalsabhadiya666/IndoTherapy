import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rewire/screens/plans_screen/allPlan_screen.dart';
import 'package:rewire/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../provider/user_provider.dart';
import '../../utils/asset_paths.dart';
import '../bottom_navy_bar/bottom_navy_bar_screen.dart';
import '../models/user_model.dart';
import 'get_started_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferences? sharedPreferences;

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        saveData();
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const OnBoardingScreen(),
        //   ),
        // );
      },
    );
  }

  saveData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String uid = pref.getString('uid') ?? '';
    print(uid.toString() + 'kkkkkkkkk');
    if (uid != null && uid != '') {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get()
          .then((value) {
        print(value.data());
        Map<String, dynamic> map = value.data() as Map<String, dynamic>;
        FirebaseUser firebaseUser = FirebaseUser.fromJson(map);

        DateTime currentDate =
            DateTime.parse(firebaseUser.updateDate.toString());
        DateTime expiryDate =
            DateTime.parse(firebaseUser.expiryDate.toString());
        bool planDate = expiryDate.isBefore(currentDate);

        print(planDate.toString() + "------>> plan");
        Provider.of<UserProvider>(context, listen: false)
            .setUser(currentUser: firebaseUser);
        if (planDate == true) {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context) {
              return AllPlanScreen(isSplash: true);
            },
          ), (route) => false);
        } else {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context) {
              return const BottomNavigationScreen();
            },
          ), (route) => false);
        }
      });
    } else {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return const GetStartedScreen();
        },
      ), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: AppConstant.displayWidth(context),
        height: AppConstant.displayHeight(context),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(splashScreen),
            fit: BoxFit.cover,
          ),
        ),
        child: const Center(
            child: Image(
          image: AssetImage(appLogoGif),
          fit: BoxFit.fitHeight,
        )),
      ),
    );
  }
}
