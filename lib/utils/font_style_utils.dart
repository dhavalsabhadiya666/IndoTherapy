import 'package:flutter/material.dart';

import 'colors.dart';

/// FONT FAMILY
const String poppinsFamily = "Poppins";

/// ------------------------------------------------------------------- ///

/// FONT WEIGHT
class FontWeightClass {
  static const regular = FontWeight.w400;
  static const medium = FontWeight.w500;
  static const semiB = FontWeight.w600;
  static const bold = FontWeight.w700;
  static const extraB = FontWeight.w800;
  static const black = FontWeight.w900;
}

/// ------------------------------------------------------------------- ///
/// FONT TEXT STYLE

class FontTextStyle {
  /// 10
  // ignore: prefer_const_constructors
  static TextStyle poppinsW4S10greyShade5 = TextStyle(
      fontFamily: poppinsFamily,
      fontSize: 10,
      color: ColorUtils.greyShade4,
      fontWeight: FontWeightClass.regular);
  static TextStyle poppinsW4S10greyShade9 = poppinsW4S10greyShade5.copyWith(
      color: ColorUtils.greyShade9, fontWeight: FontWeightClass.regular);

  /// 12
  // ignore: prefer_const_constructors
  static TextStyle poppinsW4S12greyShade4 = TextStyle(
      fontFamily: poppinsFamily,
      fontSize: 12,
      fontWeight: FontWeightClass.regular,
      color: ColorUtils.greyShade4);
  static TextStyle poppinsW4S12primaryOrange =
      poppinsW4S12greyShade4.copyWith(color: ColorUtils.primaryOrange);
  static TextStyle poppinsW5S12primaryOrange = poppinsW4S12greyShade4.copyWith(
      color: ColorUtils.primaryOrange, fontWeight: FontWeightClass.medium);
  static TextStyle poppinsW5S12white = poppinsW4S12greyShade4.copyWith(
      color: ColorUtils.white, fontWeight: FontWeightClass.medium);
  static TextStyle poppinsW5S12greyShade5 = poppinsW4S12greyShade4.copyWith(
      color: ColorUtils.greyShade5, fontWeight: FontWeightClass.medium);
  static TextStyle poppinsW4S12greyShade6 = poppinsW4S12greyShade4.copyWith(
      color: ColorUtils.greyShade6, fontWeight: FontWeightClass.regular);
  static TextStyle poppinsW4S12greyShade9 = poppinsW4S12greyShade4.copyWith(
      color: ColorUtils.greyShade9, fontWeight: FontWeightClass.regular);
  static TextStyle poppinsW4S12greyShade8 = poppinsW4S12greyShade4.copyWith(
      color: ColorUtils.greyShade8, fontWeight: FontWeightClass.regular);
  static TextStyle poppinsW4S12stromCloud = poppinsW4S12greyShade4.copyWith(
      color: ColorUtils.stromCloud, fontWeight: FontWeightClass.regular);

  /// 13
  // ignore: prefer_const_constructors

  /// 14
  // ignore: prefer_const_constructors
  static TextStyle poppinsW5S14greyShade4 = TextStyle(
      fontFamily: poppinsFamily,
      fontSize: 14,
      color: ColorUtils.greyShade4,
      fontWeight: FontWeightClass.medium);
  static TextStyle poppinsW5S14greyShade8 = poppinsW4S16greyShade7.copyWith(
    color: ColorUtils.greyShade8,
    fontWeight: FontWeightClass.medium,
  );
  static TextStyle poppinsW5S14white = poppinsW4S16greyShade7.copyWith(
    color: ColorUtils.white,
    fontWeight: FontWeightClass.medium,
  );
  static TextStyle poppinsW4S14greyShade6 = poppinsW4S16greyShade7.copyWith(
    color: ColorUtils.greyShade6,
    fontWeight: FontWeightClass.regular,
  );
  static TextStyle poppinsW4S14greyShade9 = poppinsW4S16greyShade7.copyWith(
    color: ColorUtils.greyShade9,
    fontWeight: FontWeightClass.regular,
  );
  static TextStyle poppinsW4S14stromCloud = poppinsW4S16greyShade7.copyWith(
    color: ColorUtils.stromCloud,
    fontWeight: FontWeightClass.regular,
  );

  /// 16
  // ignore: prefer_const_constructors
  static TextStyle poppinsW4S16greyShade7 = TextStyle(
    fontFamily: poppinsFamily,
    fontSize: 16,
    fontWeight: FontWeightClass.regular,
    color: ColorUtils.greyShade7,
  );

  static TextStyle poppinsW4S16greyShade4 = poppinsW4S16greyShade7.copyWith(
    color: ColorUtils.greyShade4,
    fontWeight: FontWeightClass.regular,
  );
  static TextStyle poppinsW4S16greyShade9 = poppinsW4S16greyShade7.copyWith(
    color: ColorUtils.greyShade9,
    fontWeight: FontWeightClass.regular,
  );
  static TextStyle poppinsW6S16greyShade9 = poppinsW4S16greyShade7.copyWith(
    color: ColorUtils.greyShade9,
    fontWeight: FontWeightClass.semiB,
  );
  static TextStyle poppinsW5S16stromCloud2 = poppinsW4S16greyShade7.copyWith(
    color: ColorUtils.stromCloud2,
    fontWeight: FontWeightClass.medium,
  );
  static TextStyle poppinsW5S16primaryOrange = poppinsW4S16greyShade7.copyWith(
    color: ColorUtils.primaryOrange,
    fontWeight: FontWeightClass.medium,
  );
  static TextStyle poppinsW5S16stromCloud = poppinsW4S16greyShade7.copyWith(
    color: ColorUtils.stromCloud,
    fontWeight: FontWeightClass.medium,
  );
  static TextStyle poppinsW6S16stromCloud = poppinsW4S16greyShade7.copyWith(
    color: ColorUtils.stromCloud,
    fontWeight: FontWeightClass.semiB,
  );
  static TextStyle poppinsW7S16grayShade5 = poppinsW4S16greyShade7.copyWith(
    color: ColorUtils.greyShade5,
    fontWeight: FontWeightClass.bold,
  );

  static TextStyle poppinsW5S16white = poppinsW4S16greyShade7.copyWith(
    color: ColorUtils.white,
    fontWeight: FontWeightClass.medium,
  );
  static TextStyle poppinsW5S16greyShade7 = poppinsW4S16greyShade7.copyWith(
    color: ColorUtils.greyShade7,
    fontWeight: FontWeightClass.medium,
  );
  static TextStyle poppinsW5S16greyShade9 = poppinsW4S16greyShade7.copyWith(
    color: ColorUtils.greyShade9,
    fontWeight: FontWeightClass.medium,
  );

  /// 18
  // ignore: prefer_const_constructors
  static TextStyle poppinsW6S18stromCloud = TextStyle(
      fontFamily: poppinsFamily,
      fontSize: 18,
      color: ColorUtils.stromCloud,
      fontWeight: FontWeightClass.semiB);
  static TextStyle poppinsW5S18labelColor = poppinsW7S20stromCloud.copyWith(
      fontWeight: FontWeightClass.medium, color: ColorUtils.labelColor);
  static TextStyle poppinsW5S18greyShade9 = poppinsW7S20stromCloud.copyWith(
      fontWeight: FontWeightClass.medium, color: ColorUtils.greyShade9);

  ///20
  // ignore: prefer_const_constructors
  static TextStyle poppinsW7S20stromCloud = TextStyle(
      fontFamily: poppinsFamily,
      fontSize: 20,
      color: ColorUtils.stromCloud,
      fontWeight: FontWeightClass.bold);

  static TextStyle poppinsW6S20Green = poppinsW7S20stromCloud.copyWith(
      color: ColorUtils.green, fontWeight: FontWeightClass.semiB);
  static TextStyle poppinsW5S20stromCloud =
      poppinsW7S20stromCloud.copyWith(fontWeight: FontWeightClass.medium);
  static TextStyle poppinsW6S20greyShade9 = poppinsW7S20stromCloud.copyWith(
      fontWeight: FontWeightClass.semiB, color: ColorUtils.greyShade9);

  ///24
  // ignore: prefer_const_constructors
  static TextStyle poppinsW5S24stromCloud = TextStyle(
    fontFamily: poppinsFamily,
    fontSize: 24,
    color: ColorUtils.stromCloud,
    fontWeight: FontWeightClass.medium,
  );
  static TextStyle poppinsW7S24greyShade7 = poppinsW5S24stromCloud.copyWith(
      fontWeight: FontWeightClass.bold, color: ColorUtils.greyShade7);
  static TextStyle poppinsW6S24white = poppinsW5S24stromCloud.copyWith(
      fontWeight: FontWeightClass.semiB, color: ColorUtils.white);
  static TextStyle poppinsW6S24greyShade9 = poppinsW5S24stromCloud.copyWith(
      fontWeight: FontWeightClass.semiB, color: ColorUtils.greyShade9);

  ///30
  static TextStyle poppinsW7S30stromCloud = TextStyle(
    fontFamily: poppinsFamily,
    fontSize: 30,
    color: ColorUtils.stromCloud,
    fontWeight: FontWeightClass.bold,
  );

  ///32

  static TextStyle poppinsW6S32stromCloud = TextStyle(
    fontFamily: poppinsFamily,
    fontSize: 32,
    color: ColorUtils.stromCloud,
    fontWeight: FontWeightClass.semiB,
  );
  static TextStyle poppinsW6S32White = poppinsW6S32stromCloud.copyWith(
    color: ColorUtils.white,
  );
  static TextStyle poppinsW6S32greyShade9 = poppinsW6S32stromCloud.copyWith(
    color: ColorUtils.greyShade9,
  );

  ///40

  static TextStyle poppinsW6S40greyShade9 = TextStyle(
    fontFamily: poppinsFamily,
    fontSize: 40,
    color: ColorUtils.greyShade9,
    fontWeight: FontWeightClass.semiB,
  );
}
