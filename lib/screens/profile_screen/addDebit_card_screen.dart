import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/asset_paths.dart';
import '../../utils/colors.dart';
import '../../utils/constant.dart';
import '../../utils/font_style_utils.dart';
import '../../utils/strings.dart';

class AddDebitCardScreen extends StatefulWidget {
  const AddDebitCardScreen({Key? key}) : super(key: key);

  @override
  State<AddDebitCardScreen> createState() => _AddDebitCardScreenState();
}

class _AddDebitCardScreenState extends State<AddDebitCardScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoMa1fZZlzK6O3O7iHMK5bg2sYE2gUR4cFqg&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRefCx0Fz2jVY79Iu8y4E4juQXRmLlsp2kYA&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQi0Fg0mBjLdf8LSIRMfPMSoEZ-cCaSCil2Zw&usqp=CAU"
    ];
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
            height: 300,
            width: AppConstant.displayWidth(context) * 0.75,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Image.network(item, fit: BoxFit.cover)))
        .toList();
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(backgroundImage), fit: BoxFit.fill)),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: CarouselSlider(
                  items: imageSliders,
                  carouselController: _controller,
                  options: CarouselOptions(
                      autoPlay: false,
                      enlargeCenterPage: true,
                      aspectRatio: 2,
                      viewportFraction: 0.8,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 10.0,
                      height: 10.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == entry.key
                              ? ColorUtils.primaryOrangeShade2
                              : ColorUtils.greyShade1),
                    ),
                  );
                }).toList(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      cardIcon,
                    ),
                    SizedBox(width: AppConstant.size10),
                    Text(
                      Txt.addCreditOrDebitTxt,
                      style: FontTextStyle.poppinsW4S14greyShade9,
                    )
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
