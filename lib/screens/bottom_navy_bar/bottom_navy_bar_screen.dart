import 'dart:core';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rewire/screens/homePage_screen/myCourse_screen.dart';
import 'package:rewire/screens/homePage_screen/profile_screen.dart';
import 'package:rewire/utils/colors.dart';

import '../../utils/asset_paths.dart';
import '../../utils/font_style_utils.dart';
import '../homePage_screen/homePage_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;
  final list = [
    const HomePageScreen(),
    const MyCourseScreen(),
    // const DashBoardScreen(),
    const ProfileScreen(),
  ];

  get pages => list;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final list = ['Daily Exercises', 'Programs', 'Profile'];
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: pages[_selectedIndex],
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _selectedIndex,
          onItemSelected: (index) {
            setState(() => _selectedIndex = index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              activeColor: ColorUtils.primaryOrange,
              title: Text(
                'Daily Exercises',
                style: FontTextStyle.poppinsW5S12white,
              ),
              icon: _selectedIndex == 0
                  ? SvgPicture.asset(
                      homeIconW,
                    )
                  : SvgPicture.asset(
                      homeIconB,
                    ),
            ),
            BottomNavyBarItem(
              activeColor: ColorUtils.primaryOrange,
              title: Text(
                'Programs',
                style: FontTextStyle.poppinsW5S12white,
              ),
              icon: _selectedIndex == 1
                  ? SvgPicture.asset(
                      myCourseIconW,
                    )
                  : SvgPicture.asset(
                      myCourseIconB,
                    ),
            ),
            // BottomNavyBarItem(
            //   activeColor: ColorUtils.primaryOrange,
            //   title: Text(
            //     'My Progress',
            //     style: FontTextStyle.poppinsW5S12white,
            //   ),
            //   icon: _selectedIndex == 2
            //       ? SvgPicture.asset(
            //           dashBoardIconW,
            //         )
            //       : SvgPicture.asset(
            //           dashBoardIconB,
            //         ),
            // ),  // BottomNavyBarItem(
            //   activeColor: ColorUtils.primaryOrange,
            //   title: Text(
            //     'My Progress',
            //     style: FontTextStyle.poppinsW5S12white,
            //   ),
            //   icon: _selectedIndex == 2
            //       ? SvgPicture.asset(
            //           dashBoardIconW,
            //         )
            //       : SvgPicture.asset(
            //           dashBoardIconB,
            //         ),
            // ),
            BottomNavyBarItem(
              activeColor: ColorUtils.primaryOrange,
              title: Text(
                'Profile',
                style: FontTextStyle.poppinsW5S12white,
              ),
              icon: _selectedIndex == 2
                  ? SvgPicture.asset(
                      profileIconW,
                    )
                  : SvgPicture.asset(
                      profileIconB,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
