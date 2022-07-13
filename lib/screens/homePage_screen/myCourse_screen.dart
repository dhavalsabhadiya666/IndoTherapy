import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rewire/screens/integrativeTherapy_screen/integrativeTherapy_Audioscreen.dart';
import 'package:rewire/screens/integrativeTherapy_screen/integrativeTherapy_Videoscreen.dart';
import 'package:rewire/screens/models/course_model.dart';
import 'package:rewire/services/profile_services.dart';
import 'package:rewire/utils/constant.dart';
import 'package:rewire/utils/font_style_utils.dart';
import 'package:rewire/utils/strings.dart';
import 'package:rewire/widgets/custom_button.dart';

import '../../utils/asset_paths.dart';
import '../../utils/colors.dart';

class MyCourseScreen extends StatefulWidget {
  const MyCourseScreen({Key? key}) : super(key: key);

  @override
  State<MyCourseScreen> createState() => _MyCourseScreenState();
}

class _MyCourseScreenState extends State<MyCourseScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.pastelBlue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Image(
              image: AssetImage(frameLogo),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              Txt.programsTxt,
              style: FontTextStyle.poppinsW5S24stromCloud,
            ),
          ),
          Expanded(
            child: Container(
              height: AppConstant.displayHeight(context),
              width: AppConstant.displayWidth(context),
              decoration: BoxDecoration(
                  color: ColorUtils.white,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(25))),
              child: StreamBuilder<QuerySnapshot>(
                  stream: ProfileService.courseData(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData && snapshot.data!.docs.length != 0) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.none) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        int length = snapshot.data!.docs.length;
                        final docList = snapshot.data!.docs;
                        return ListView.builder(
                            itemCount: length,
                            itemBuilder: (context, index) {
                              Map<String, dynamic> currentUser =
                                  docList[index].data() as Map<String, dynamic>;
                              CourseModel currentModel =
                                  CourseModel.fromJson(currentUser);
                              return CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            IntegrativeTherapyVideoScreen(
                                                courseModel: currentModel)),
                                  );

                                  /* showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    backgroundColor: ColorUtils.white,
                                    builder: (BuildContext context) {
                                      return Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        height: 320,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(15))),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    top: 8, bottom: 20),
                                                height: 5,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    color:
                                                        ColorUtils.greyShade3,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                              ),
                                            ),
                                            Text(
                                              Txt.selectMediaTxt,
                                              style: FontTextStyle
                                                  .poppinsW6S16stromCloud,
                                            ),
                                            SizedBox(
                                                height: AppConstant.size10),
                                            Divider(),
                                            SizedBox(
                                                height: AppConstant.size20),
                                            StatefulBuilder(
                                              builder: (BuildContext context,
                                                  void Function(void Function())
                                                      setState) {
                                                return Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    CupertinoButton(
                                                      padding: EdgeInsets.zero,
                                                      onPressed: () {
                                                        setState(() {
                                                          index = 1;
                                                        });
                                                      },
                                                      child: Container(
                                                        margin: const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 15),
                                                        height: 116,
                                                        width: 112,
                                                        decoration: BoxDecoration(
                                                            color: index == 1
                                                                ? ColorUtils
                                                                    .primaryOrangeShade5
                                                                : ColorUtils
                                                                    .transparent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            border: Border.all(
                                                                color: index ==
                                                                        1
                                                                    ? ColorUtils
                                                                        .primaryOrange
                                                                    : ColorUtils
                                                                        .greyShade1),
                                                            image: const DecorationImage(
                                                                image: AssetImage(
                                                                    videoLogo))),
                                                      ),
                                                    ),
                                                    CupertinoButton(
                                                      padding: EdgeInsets.zero,
                                                      onPressed: () {
                                                        setState(() {
                                                          index = 2;
                                                        });
                                                      },
                                                      child: Container(
                                                        height: 116,
                                                        width: 112,
                                                        margin: const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 15),
                                                        decoration: BoxDecoration(
                                                            color: index == 2
                                                                ? ColorUtils
                                                                    .primaryOrangeShade5
                                                                : ColorUtils
                                                                    .transparent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            border: Border.all(
                                                                color: index ==
                                                                        2
                                                                    ? ColorUtils
                                                                        .primaryOrange
                                                                    : ColorUtils
                                                                        .greyShade1),
                                                            image: const DecorationImage(
                                                                image: AssetImage(
                                                                    audioLogo))),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                            SizedBox(
                                                height: AppConstant.size20),
                                            CustomButton(
                                              title: Txt.continueTxt,
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        index == 1
                                                            ? IntegrativeTherapyVideoScreen(
                                                                courseModel:
                                                                    currentModel)
                                                            : const IntegrativeTherapyAudioScreen(),
                                                  ),
                                                );
                                              },
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  );*/
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 10),
                                  padding: const EdgeInsets.all(16),
                                  height: 115,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: ColorUtils.solid),
                                  child: Row(
                                    children: [
                                      Image(
                                          image: CachedNetworkImageProvider(
                                              currentModel.courseImage
                                                  .toString())),
                                      SizedBox(width: AppConstant.size15),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              currentModel.courseName
                                                  .toString(),
                                              style: FontTextStyle
                                                  .poppinsW5S16greyShade9,
                                            ),
                                            SizedBox(height: AppConstant.size5),
                                            Expanded(
                                              child: Text(
                                                currentModel.courseDescription
                                                    .toString(),
                                                style: FontTextStyle
                                                    .poppinsW4S12greyShade8,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text("5 May",
                                                    style: FontTextStyle
                                                        .poppinsW4S10greyShade5),
                                                SizedBox(
                                                    width: AppConstant.size5),
                                                Icon(Icons.circle,
                                                    color:
                                                        ColorUtils.greyShade5,
                                                    size: 5),
                                                SizedBox(
                                                    width: AppConstant.size5),
                                                Text("36 min",
                                                    style: FontTextStyle
                                                        .poppinsW4S10greyShade5),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      }
                    } else {
                      return Container(
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Text('no data available'),
                            ),
                          ],
                        ),
                      );
                    }
                  }),
            ),
          )
        ],
      ),
    );
  }
}
