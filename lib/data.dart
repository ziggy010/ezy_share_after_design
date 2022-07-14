import 'dart:ui';

import 'package:ezy_share_got_design/constants.dart';

class HomeCardInfo {
  Color cardColor;
  final String heading;

  HomeCardInfo(
    this.cardColor, {
    this.heading = '',
  });
}

List<HomeCardInfo> cards = [
  HomeCardInfo(
    kNavbarColor,
    heading: 'card1',
  ),
  HomeCardInfo(
    Color(0xFFC5C6F7),
    heading: 'card2',
  ),
  HomeCardInfo(
    Color(0xFFC5C6F7),
    heading: 'card3',
  ),
];
