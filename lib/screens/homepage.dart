import 'package:ezy_share_got_design/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:ezy_share_got_design/data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Homepage extends StatefulWidget {
  static const String id = 'Homepage';

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  SwiperController _controller = SwiperController();

  int onCardNumber = 0;

  Color primaryCardColor = Color(0xFF585CE5);
  Color secondaryCardColor = Color(0xFFC5C6F7);

  List<HomeCardInfo> homeCards = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD3D3D3),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 24,
          top: 70,
          right: 24,
          bottom: 30,
        ),
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
                        fontFamily: 'manrope',
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
                          fontFamily: 'manrope',
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
                          'Visiting Card',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontFamily: 'manrope',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 24.w,
                        ),
                        Text(
                          'Passport',
                          style: TextStyle(
                            color: Color(0x34211F30),
                            fontFamily: 'manrope',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: 24.w,
                        ),
                        Text(
                          'Citizenship',
                          style: TextStyle(
                            color: Color(0x34211F30),
                            fontFamily: 'manrope',
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
              child: Container(
                height: 430.h,
                child: Swiper(
                  pagination: SwiperPagination(
                    margin: EdgeInsets.only(top: 50.h),
                    builder: DotSwiperPaginationBuilder(
                      activeColor: Colors.black,
                    ),
                  ),
                  onIndexChanged: (value) {
                    setState(() {
                      onCardNumber = value;
                    });
                    print(onCardNumber);
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
                          child: Card(
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            color: cards[index].cardColor,
                            child: Padding(
                              padding: const EdgeInsets.all(50.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
