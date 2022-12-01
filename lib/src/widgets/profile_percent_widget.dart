import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../styles.dart';

class ProfilePercentWidget extends StatelessWidget {
  final double height;
  final double percent;
  
  const ProfilePercentWidget({Key? key, this.height = 20, this.percent = 0})
      : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Stack(
        children: [
          Container(
            width: 100.0.w,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: context.theme.mainTextColor)
              ),
            ),
          ),
          Container(
            width: percent.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: context.theme.greyMedium,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text('your_profile_complete'.trParams({'percent': '50%'})!,
              style: AppTextStyles.robotoCondensed(
                  fontSize: 12, fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }

}