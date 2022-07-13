import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rewire/utils/colors.dart';
import 'package:rewire/utils/constant.dart';
import 'package:rewire/utils/font_style_utils.dart';

import '../../utils/asset_paths.dart';

class IntegrativeTherapyAudioScreen extends StatefulWidget {
  const IntegrativeTherapyAudioScreen({Key? key}) : super(key: key);

  @override
  State<IntegrativeTherapyAudioScreen> createState() =>
      _IntegrativeTherapyAudioScreenState();
}

class _IntegrativeTherapyAudioScreenState
    extends State<IntegrativeTherapyAudioScreen> {
  @override
  final List<String> imgList = [
    "https://i.cdn.newsbytesapp.com/images/l70920220203030648.jpeg",
    "https://www.verywellfit.com/thmb/FWWYepy5Wj81-OhFA7eSJH8qa-w=/1232x650/filters:fill(FFDB5D,1)/Illo_Yoga-89e76b0ced724b51a15c43626aeee4bc.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMckoLyFOZFOhKLsOE9p9ChRL6rOPWlWgPZQ&usqp=CAU"
  ];
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
            height: 300,
            width: AppConstant.displayWidth(context) * 0.75,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Image.network(item, fit: BoxFit.cover)))
        .toList();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_outlined),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(5),
                      height: 25,
                      width: 65,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: ColorUtils.stromCloud),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: ColorUtils.white,
                            radius: 10,
                            child: Icon(
                              Icons.mic,
                              size: 15,
                              color: ColorUtils.stromCloud,
                            ),
                          ),
                          Text(
                            "Music",
                            style: FontTextStyle.poppinsW5S12white
                                .copyWith(fontSize: 10),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: AppConstant.size10),
                    Icon(Icons.favorite_outlined, color: Color(0xffCB5647))
                  ],
                ),
              ),
              SizedBox(height: AppConstant.size20),
              Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: false,
                    aspectRatio: 2.0,
                    viewportFraction: 0.7,
                    enlargeCenterPage: true,
                  ),
                  items: imageSliders,
                ),
              ),
              SizedBox(height: AppConstant.size20),
              Text(
                "It can sometimes be difficult for\nparents, especially new\nbecome accustomed after the birth of\na child.",
                textAlign: TextAlign.center,
                style: FontTextStyle.poppinsW6S16greyShade9,
              ),
              Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(16),
                width: AppConstant.displayWidth(context),
                // height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: ColorUtils.stromCloud3),
                child: Column(
                  children: [
                    Text(
                      "IMPACT OF BIRTH ON\nEMOTIONAL HEALTH",
                      textAlign: TextAlign.center,
                      style: FontTextStyle.poppinsW6S24greyShade9,
                    ),
                    SizedBox(height: AppConstant.size15),
                    Text(
                      "Integrative therapy is a progressive form\nof psychotherapy that combines different\ntherapeutic ...",
                      textAlign: TextAlign.center,
                      style: FontTextStyle.poppinsW4S12stromCloud,
                    ),
                    SizedBox(height: AppConstant.size15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          arrowLeft,
                        ),
                        SvgPicture.asset(
                          left,
                        ),
                        SvgPicture.asset(
                          play,
                        ),
                        SvgPicture.asset(
                          right,
                        ),
                        SvgPicture.asset(
                          arrowRight,
                        ),
                      ],
                    ),
                    SizedBox(height: AppConstant.size15),
                    LinearProgressIndicator(
                      value: 0.33,
                      color: ColorUtils.primaryOrange,
                      backgroundColor: ColorUtils.white,
                    ),
                    SizedBox(height: AppConstant.size10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "00:58",
                          style: FontTextStyle.poppinsW4S10greyShade9,
                        ),
                        Text(
                          "03:12",
                          style: FontTextStyle.poppinsW4S10greyShade9,
                        ),
                      ],
                    ),
                    SizedBox(height: AppConstant.size15),
                    SvgPicture.asset(
                      dot,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
