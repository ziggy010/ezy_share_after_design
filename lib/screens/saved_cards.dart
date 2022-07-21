import 'package:ezy_share_got_design/components/free_design.dart';
import 'package:ezy_share_got_design/components/saved_cards_data.dart';
import 'package:ezy_share_got_design/constants.dart';
import 'package:ezy_share_got_design/screens/Saved_card_new_page.dart';
import 'package:ezy_share_got_design/scanner/document_scan.dart';
import 'package:ezy_share_got_design/screens/final_Qr_ScanPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/qr_content.dart';
import 'homepage.dart';

class SavedCard extends StatefulWidget {
  static const String id = 'SavedCard';

  @override
  State<SavedCard> createState() => _SavedCardState();
}

class _SavedCardState extends State<SavedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  TextEditingController textEditingController = TextEditingController();

  int currentIndex = 0;
  bool isQrContentVisible = false;
  double currentOpacity = 0.0;
  updateOpacity() {
    setState(() {
      if (currentOpacity == 0.0) {
        currentOpacity = 1;
      } else {
        currentOpacity = 0.0;
      }
    });
  }

  double _containerHeight = 0;

  updateContainerHeight() {
    setState(() {
      if (_containerHeight == 0) {
        _containerHeight = 208.h;
      } else {
        _containerHeight = 0;
      }
    });
  }

  String before = 'Scanner';
  String after = 'close';

  String finalImage = 'Scanner';

  List<SavedCardData> allCardData = allSavedCardDataClass;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void searchCard(String query) {
    final suggestions = allSavedCardDataClass.where((element) {
      final bookTitle = element.title.toLowerCase();
      final searchInput = query.toLowerCase();

      return bookTitle.contains(searchInput);
    }).toList();

    setState(() {
      allCardData = suggestions;
    });
  }

  bool isAlphabetical = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kNavbarColor,
          title: Text(
            'Saved Cards',
            style: kNavbarText,
          ),
        ),
        backgroundColor: kBackgroundColor,
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 24.w,
                top: 24.h,
                right: 24.w,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          autocorrect: false,
                          controller: textEditingController,
                          onChanged: searchCard,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: 'Search Cards',
                            prefixIcon: Icon(
                              Icons.search_outlined,
                              color: kNavbarColor,
                              size: 30.sm,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: kContainerColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: kNavbarColor,
                                width: 1.5,
                              ),
                            ),
                            filled: true,
                            fillColor: kContainerColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      PopupMenuButton(
                        offset: Offset(0, 20),
                        color: Colors.white,
                        elevation: 1,
                        splashRadius: 0,
                        position: PopupMenuPosition.under,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        constraints: BoxConstraints(
                          minHeight: 144.h,
                          maxWidth: 187.w,
                        ),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            onTap: () {
                              setState(() {
                                isAlphabetical = !isAlphabetical;
                                print(isAlphabetical);
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 16.h,
                                bottom: 16.h,
                              ),
                              child: Container(
                                height: 48.h,
                                width: 155.w,
                                decoration: BoxDecoration(
                                  color: kContainerColor,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Center(
                                  child: Text(
                                    'Alphabetic (A - Z)',
                                    style: TextStyle(
                                      color: kNavbarColor,
                                      fontFamily: 'manrope',
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          PopupMenuItem(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 16.h),
                              child: Container(
                                height: 48.h,
                                width: 155.w,
                                decoration: BoxDecoration(
                                  color: kContainerColor,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Center(
                                  child: Text(
                                    'Recently Added',
                                    style: TextStyle(
                                      color: kNavbarColor,
                                      fontFamily: 'manrope',
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                        child: Container(
                          height: 55.h,
                          width: 55.w,
                          decoration: BoxDecoration(
                            color: kContainerColor,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Center(
                            child: Image.asset('lib/icons/Filter.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: allCardData.length,
                      itemBuilder: ((context, index) {
                        final sortedItems = allCardData
                          ..sort(
                            ((a, b) => isAlphabetical
                                ? a.title.compareTo(b.title)
                                : a.title.compareTo(a.title)),
                          );

                        final data = sortedItems[index];

                        return Container(
                          margin: EdgeInsets.only(bottom: 10.h),
                          child: ListTile(
                            contentPadding: EdgeInsets.all(0),
                            leading: CircleAvatar(
                              radius: 22.r,
                              backgroundColor: Color(0xFFBABCFF),
                              child: Center(
                                child: Text(
                                  data.title[0].toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            title: Text(data.title),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) {
                                    return SavedCardNewPage(
                                      savedCardData: data,
                                    );
                                  }),
                                ),
                              );
                            },
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 87.w,
              bottom: 50.h,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 700),
                opacity: currentOpacity,
                curve: Curves.fastOutSlowIn,
                child: Container(
                  height: _containerHeight,
                  width: 187.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, DocumentScan.id);
                      },
                      child: QrContent(
                        text: 'Citizenship',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, DocumentScan.id);
                      },
                      child: QrContent(
                        text: 'Passport',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, FinalQrPage.id);
                      },
                      child: QrContent(
                        text: 'QR Scan',
                      ),
                    )
                  ]),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: CircleAvatar(
          radius: 35.r,
          backgroundColor: kNavbarColor,
          child: Stack(
            children: [
              FloatingActionButton(
                elevation: 0,
                onPressed: () {
                  setState(() {
                    isQrContentVisible = !isQrContentVisible;
                    finalImage = isQrContentVisible ? after : before;
                    updateOpacity();
                    updateContainerHeight();
                    if (_controller.isCompleted) {
                      _controller.reverse();
                    } else {
                      _controller.forward();
                    }
                  });
                },
                child: RotationTransition(
                  turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                  child: Image.asset(
                    'lib/icons/$finalImage.png',
                    color: Colors.white,
                    height: 20,
                  ),
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
            padding: EdgeInsets.symmetric(horizontal: 86.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Homepage.id);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          'lib/icons/Vector.png',
                          color: Color(0xFFB2B2B3),
                        ),
                      ),
                      Text(
                        'My Cards',
                        style: TextStyle(
                          color: Color(0xFFB2B2B3),
                          fontSize: 10.sp,
                          fontFamily: 'poppins',
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(0xFFF2F6FD),
                      child: Image.asset(
                        'lib/icons/Bookmark.png',
                        color: kNavbarColor,
                      ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
