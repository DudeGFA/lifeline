import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifeline/core/constant/assets_location.dart';
import 'package:lifeline/core/constant/color.dart';
import 'package:lifeline/core/constant/spacing.dart';

class FeatureCard extends StatelessWidget {
  const FeatureCard(
      {super.key,
      required this.image,
      required this.label,
      required this.onTap});

  final String label;
  final String image;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 270.h,
        width: 180.w,
        // margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: HexColors.blue10,
        ),
        padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.w),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset(Assets.shining)),
            Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(color: AppColors.white),
            ),
            SpacingManager.h13,
            Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(100),
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: AppColors.white05)),
                child: SvgPicture.asset(
                  image,
                  height: 45.h,
                )),
          ],
        ),
      ),
    );
  }
}
