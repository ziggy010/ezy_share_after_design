import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardDesign1 extends StatelessWidget {
  const CardDesign1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(12.r),
          image: DecorationImage(
            image: AssetImage('lib/images/image 4.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
