import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifeline/core/constant/assets_location.dart';
import 'package:lifeline/core/constant/color.dart';
import 'package:lifeline/core/constant/spacing.dart';

class FormSubmission extends StatelessWidget {
  const FormSubmission({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SpacingManager.h48,
          Text(
            'Congratulation',
            style: GoogleFonts.openSans(
                fontWeight: FontWeight.bold, fontSize: 25.sp),
          ),
          Text(
            'Cras laoreet non ex quis iaculis. Duis ligula dolor Cras laoreet non ex quis iaculis. Duis ligula dolor',
            style: GoogleFonts.openSans(
                fontSize: 14.sp, color: AppColors.greyColor),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
          ),
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 15.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: HexColors.blue10),
              child: Center(
                child: Column(
                  children: [
                    Image.asset(Assets.email),
                    SpacingManager.h13,
                    Text(
                      'Thank you for submitting your registration! Your information has been received and is currently undergoing review. You will receive an email notification once your registration status is confirmed.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                          fontSize: 14.sp, color: AppColors.white),
                    )
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
