import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rewire/screens/homePage_screen/categories_screen.dart';
import 'package:rewire/screens/homePage_screen/myCourse_screen.dart';
import 'package:rewire/screens/models/categories_model.dart';
import 'package:rewire/services/profile_services.dart';
import '../../utils/asset_paths.dart';
import '../../utils/colors.dart';
import '../../utils/constant.dart';
import '../../utils/font_style_utils.dart';
import '../../utils/strings.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.pastelBlue,
      body: SingleChildScrollView(
        child: Column(
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
                    Txt.homeDesTxt,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: ColorUtils.stromCloud,
                        fontSize: 15,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppConstant.size25),
            Container(
              padding: EdgeInsets.only(bottom: 20, left: 16),
              width: AppConstant.displayWidth(context),
              decoration: BoxDecoration(
                  color: ColorUtils.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppConstant.size20),
                  Text(
                    Txt.recommendedForYouTxt,
                    style: FontTextStyle.poppinsW5S16stromCloud,
                  ),
                  SizedBox(height: AppConstant.size15),
                  Container(
                    height: 285,
                    child: ListView.builder(
                        itemCount: 2,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Container(
                              margin: EdgeInsets.only(right: 15),
                              width: 252,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 182,
                                    width: 252,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(dramaImage))),
                                  ),
                                  SizedBox(height: AppConstant.size10),
                                  Row(
                                    children: [
                                      Text("5 May",
                                          style: FontTextStyle
                                              .poppinsW4S10greyShade5),
                                      SizedBox(width: AppConstant.size5),
                                      Icon(Icons.circle,
                                          color: ColorUtils.greyShade5,
                                          size: 5),
                                      SizedBox(width: AppConstant.size5),
                                      Text("36 min",
                                          style: FontTextStyle
                                              .poppinsW4S10greyShade5),
                                    ],
                                  ),
                                  SizedBox(height: AppConstant.size5),
                                  Text(
                                    Txt.dramaTxt,
                                    style: FontTextStyle.poppinsW5S14greyShade8,
                                  )
                                ],
                              ),
                            )),
                  ),
                  Container(
                    height: 10,
                    color: ColorUtils.greyShade1.withOpacity(0.5),
                  ),
                  SizedBox(height: AppConstant.size20),
                  Text(
                    Txt.recentlyPlayedTxt,
                    style: FontTextStyle.poppinsW5S16stromCloud,
                  ),
                  SizedBox(height: AppConstant.size15),
                  /*StreamBuilder<QuerySnapshot>(
                      stream: ProfileService.contentData(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData &&
                            snapshot.data!.docs.length != 0) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
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
                            return ListView.separated(
                                separatorBuilder: (context, index) => Divider(
                                      height: 1,
                                      thickness: 2,
                                    ),
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: length,
                                itemBuilder: (context, index) {
                                  Map<String, dynamic> currentUser =
                                      docList[index].data()
                                          as Map<String, dynamic>;
                                  ContentModel currentModel =
                                      ContentModel.fromJson(currentUser);
                                  return Container(
                                    margin: EdgeInsets.only(right: 15),
                                    width: 182,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 106,
                                          width: 182,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(yogaImage),
                                                  fit: BoxFit.cover)),
                                        ),
                                        SizedBox(height: AppConstant.size10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              currentModel.contentDescription ??
                                                  "Null",
                                              style: FontTextStyle
                                                  .poppinsW5S14greyShade8,
                                            ),
                                            Text(
                                              "10:00",
                                              style: FontTextStyle
                                                  .poppinsW4S12greyShade4,
                                            )
                                          ],
                                        ),
                                        SizedBox(height: AppConstant.size10),
                                        LinearProgressIndicator(
                                          value: 0.66,
                                          color: ColorUtils.primaryOrange,
                                          backgroundColor:
                                              ColorUtils.greyShade2,
                                        ),
                                      ],
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
                      }),*/
                  Container(
                    height: 185,
                    child: ListView.builder(
                        itemCount: 2,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Container(
                              margin: EdgeInsets.only(right: 15),
                              width: 182,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 106,
                                    width: 182,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(yogaImage),
                                            fit: BoxFit.cover)),
                                  ),
                                  SizedBox(height: AppConstant.size10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Sleepy soul",
                                        style: FontTextStyle
                                            .poppinsW5S14greyShade8,
                                      ),
                                      Text(
                                        "10:00",
                                        style: FontTextStyle
                                            .poppinsW4S12greyShade4,
                                      )
                                    ],
                                  ),
                                  SizedBox(height: AppConstant.size10),
                                  LinearProgressIndicator(
                                    value: 0.66,
                                    color: ColorUtils.primaryOrange,
                                    backgroundColor: ColorUtils.greyShade2,
                                  ),
                                ],
                              ),
                            )),
                  ),
                  Container(
                    height: 10,
                    color: ColorUtils.greyShade1.withOpacity(0.5),
                  ),
                  SizedBox(height: AppConstant.size20),
                  Text(
                    "What kind of support would you like today?",
                    style: FontTextStyle.poppinsW5S16stromCloud,
                  ),
                  StreamBuilder<QuerySnapshot>(
                      stream: ProfileService.categoryData(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData &&
                            snapshot.data!.docs.length != 0) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.connectionState ==
                              ConnectionState.none) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            print(snapshot.data!.docs[0].data().toString() +
                                "---->>Data");
                            int length = snapshot.data!.docs.length;
                            final docList = snapshot.data!.docs;
                            return GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: length,
                                // scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1.25,
                                ),
                                itemBuilder: (context, index) {
                                  Map<String, dynamic> currentUser =
                                      docList[index].data()
                                          as Map<String, dynamic>;
                                  CategoryModel currentModel =
                                      CategoryModel.fromJson(currentUser);
                                  return GestureDetector(
                                    onTap: () {
                                      // print(currentModel.categoryId.toString() +
                                      //   "categoryId");
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CategoriesScreen(
                                              categoryModel: currentModel,
                                            ),
                                          ));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 16),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      height: 115,
                                      width: AppConstant.displayWidth(context) *
                                          0.40,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                  currentModel.categoryImage
                                                      .toString()))),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            currentModel.categoryName
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: FontTextStyle
                                                .poppinsW5S14greyShade8,
                                          ),
                                        ),
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
                  // SizedBox(
                  //   height: 300,
                  //   child: GridView.builder(
                  //       itemCount: 7,
                  //       // scrollDirection: Axis.horizontal,
                  //       shrinkWrap: true,
                  //       gridDelegate:
                  //           const SliverGridDelegateWithFixedCrossAxisCount(
                  //         crossAxisCount: 2,
                  //         childAspectRatio: 1.25,
                  //         // crossAxisSpacing: 0.4,
                  //       ),
                  //       itemBuilder: (context, index) {
                  //         return Container(
                  //           padding: EdgeInsets.symmetric(vertical: 10),
                  //           height: 115,
                  //           width: AppConstant.displayWidth(context) * 0.40,
                  //           decoration: const BoxDecoration(
                  //               image: DecorationImage(
                  //                   image: AssetImage(categoriesImage1))),
                  //           child: Text(
                  //             "hahaha",
                  //             textAlign: TextAlign.center,
                  //             style: FontTextStyle.poppinsW5S14white,
                  //           ),
                  //         );
                  //       }),
                  // ),
                  const SizedBox(height: AppConstant.size20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
// ListView.separated(
// separatorBuilder: (context, index) => Divider(
// height: 1,
// thickness: 2,
// ),
// shrinkWrap: true,
// physics: NeverScrollableScrollPhysics(),
// itemCount: length,
// itemBuilder: (context, index) {
// Map<String, dynamic> currentUser =
// docList[index].data()
// as Map<String, dynamic>;
// ContentModel currentModel =
// ContentModel.fromJson(currentUser);
// return Container(
// padding: EdgeInsets.symmetric(vertical: 10),
// height: 115,
// width: AppConstant.displayWidth(context) *
// 0.40,
// decoration: const BoxDecoration(
// image: DecorationImage(
// image:
// AssetImage(categoriesImage1))),
// child: Text(
// "hahaha",
// textAlign: TextAlign.center,
// style: FontTextStyle.poppinsW5S14white,
// ),
// );
// });
