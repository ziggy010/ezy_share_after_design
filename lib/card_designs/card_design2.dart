import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardDesign2 extends StatelessWidget {
  final String companyName;
  final String fullname;
  final String phoneNumber;
  final String email;
  final String webiste;

  CardDesign2({
    required this.companyName,
    required this.fullname,
    required this.phoneNumber,
    required this.email,
    required this.webiste,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF15273E),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Flexible(
            child: Container(
              width: 170.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  bottomLeft: Radius.circular(12.r),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(
                      'lib/images/e.png',
                    ),
                    height: 50.h,
                    width: 50.h,
                  ),
                  Text(
                    companyName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontFamily: 'poppins',
                    ),
                  ),
                  Text(
                    'Share your cards.',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 10.sp,
                      fontFamily: 'poppins',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF15273E),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.r),
                  bottomRight: Radius.circular(12.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 12.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fullname,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontFamily: 'poppins',
                      ),
                    ),
                    Text(
                      companyName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 9.sp,
                        fontFamily: 'poppins',
                      ),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.phone_outlined,
                          color: Colors.white,
                          size: 12,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          phoneNumber,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'poppins',
                            fontSize: 8.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.email_outlined,
                          color: Colors.white,
                          size: 12,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          email,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'poppins',
                            fontSize: 8.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.public_outlined,
                          color: Colors.white,
                          size: 12,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          webiste,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'poppins',
                            fontSize: 7.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
