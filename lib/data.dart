import 'dart:ui';

class HomeCardInfo {
  final Color cardColor;
  final String heading;

  HomeCardInfo(
    this.cardColor, {
    this.heading = '',
  });
}

List<HomeCardInfo> cards = [
  HomeCardInfo(
    Color(0xFF585CE5),
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
