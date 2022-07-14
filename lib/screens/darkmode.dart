import 'package:ezy_share_got_design/components/bottom_navbar.dart';
import 'package:ezy_share_got_design/components/qr_button.dart';
import 'package:ezy_share_got_design/constants.dart';
import 'package:ezy_share_got_design/screens/profile.dart';
import 'package:ezy_share_got_design/screens/saved_cards.dart';
import 'package:ezy_share_got_design/screens/visiting_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:ezy_share_got_design/data.dart';
import 'package:indexed/indexed.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DarkMode extends StatefulWidget {
  static const String id = 'DarkMode';

  @override
  State<DarkMode> createState() => _DarkModeState();
}

class _DarkModeState extends State<DarkMode> {
  SwiperController _controller = SwiperController();

  int onCardNumber = 0;

  int currentIndex = 0;

  Color primaryCardColor = Color(0xFF585CE5);
  Color secondaryCardColor = Color(0xFFC5C6F7);

  String getTitleFirst(int onCardNumber) {
    if (onCardNumber == 0) {
      return 'Visiting Card';
    } else if (onCardNumber == 1) {
      return 'Passport';
    } else {
      return 'Citizenship';
    }
  }

  String getTitleSecond(int onCardNumber) {
    if (onCardNumber == 0) {
      return 'Passport';
    } else if (onCardNumber == 1) {
      return 'Citizenship';
    } else {
      return 'Visiting Card';
    }
  }

  String getTitleThird(int onCardNumber) {
    if (onCardNumber == 0) {
      return 'Citizenship';
    } else if (onCardNumber == 1) {
      return 'Visiting card';
    } else {
      return 'Passport';
    }
  }

  Color getCardColor(int onCardColor) {
    if (onCardColor == 0) {
      return primaryCardColor;
    } else {
      return secondaryCardColor;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  String before = 'Scanner';
  String after = 'close';

  String finalImage = 'Scanner';

  bool a = true;

  bool isQrContentVisible = false;

  Color blurBackground = Color(0xFF353746);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: Color(0xFF353746),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 24,
          top: 70,
          right: 24,
          bottom: 30,
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, Bibek',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'poppins',
                          color: Color(0x55211F30),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: 10.h,
                      ),
                      Text(
                        'Welcome back!',
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: 'poppins',
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Profile.id);
                    },
                    child: CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 36.h,
              ),
              Container(
                constraints: BoxConstraints(
                  maxHeight: 30.h,
                ),
                child: Row(
                  children: [
                    Flexible(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Text(
                            getTitleFirst(onCardNumber),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            width: 24.w,
                          ),
                          Text(
                            getTitleSecond(onCardNumber),
                            style: TextStyle(
                              color: Color(0x34211F30),
                              fontFamily: 'poppins',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 24.w,
                          ),
                          Text(
                            getTitleThird(onCardNumber),
                            style: TextStyle(
                              color: Color(0x34211F30),
                              fontFamily: 'poppins',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 11.h,
              ),
              Container(
                height: 3.h,
                width: 55.h,
                color: Color(0xFF7B66FF),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 9.w,
                ),
                child: Stack(
                  children: [
                    Container(
                      height: 430.h,
                      child: Swiper(
                        pagination: SwiperPagination(
                          margin: EdgeInsets.only(top: 50.h),
                          builder: const DotSwiperPaginationBuilder(
                            activeColor: Color(0xFF5D5FEF),
                            color: Color(0x305D5FEF),
                          ),
                        ),
                        onIndexChanged: (value) {
                          setState(() {
                            onCardNumber = value;
                          });
                        },
                        itemCount: 3,
                        itemWidth: 230.w,
                        layout: SwiperLayout.STACK,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: 25.h,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, VisitingCard.id);
                                  },
                                  child: Card(
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    color: getCardColor(index),
                                    child: Padding(
                                      padding: const EdgeInsets.all(50.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          Text(
                                            cards[index].heading,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30.sp,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Positioned(
                      left: 67,
                      bottom: 0,
                      child: Visibility(
                        visible: isQrContentVisible,
                        child: Container(
                          height: 208.h,
                          width: 187.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(children: [
                            QrContent(
                              text: 'Citizenship',
                            ),
                            QrContent(
                              text: 'Passport',
                            ),
                            QrContent(
                              text: 'QR Scan',
                            )
                          ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: CircleAvatar(
        radius: 35,
        backgroundColor: kNavbarColor,
        child: Stack(
          children: [
            FloatingActionButton(
              elevation: 0,
              onPressed: () {
                setState(() {
                  isQrContentVisible = !isQrContentVisible;
                  finalImage = isQrContentVisible ? after : before;
                });
              },
              child: Image.asset(
                'lib/icons/$finalImage.png',
                color: Colors.white,
                height: 20,
              ),
              backgroundColor: kNavbarColor,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 107.h,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 70.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xFFF2F6FD),
                    child: Image.asset('lib/icons/Vector.png'),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    'My Cards',
                    style: TextStyle(
                      color: kNavbarColor,
                      fontSize: 10.sp,
                      fontFamily: 'poppins',
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SavedCard.id);
                    },
                    child: Image.asset('lib/icons/Bookmark.png'),
                  ),
                  Text(
                    'Saved Cards',
                    style: TextStyle(
                      color: Color(0xFFB2B2B3),
                      fontSize: 10.sp,
                      fontFamily: 'poppins',
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QrContent extends StatelessWidget {
  final String text;

  QrContent({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 14.h),
      child: Container(
        height: 48.h,
        width: 155.w,
        decoration: BoxDecoration(
          color: kContainerColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
            color: kNavbarColor,
            fontFamily: 'poppins',
            fontSize: 14.sp,
          ),
        )),
      ),
    );
  }
}
