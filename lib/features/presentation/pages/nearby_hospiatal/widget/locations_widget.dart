import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifeline/core/constant/assets_location.dart';
import 'package:lifeline/core/constant/color.dart';
import 'package:lifeline/core/constant/spacing.dart';

class LocationSearchWidget extends StatelessWidget {
  const LocationSearchWidget({
    Key? key,
    required this.hospital,
    required this.kilometer,
    required this.time,
  }) : super(key: key);
  final String hospital;
  final String kilometer;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.white,
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 2),
                  blurRadius: 7,
                  blurStyle: BlurStyle.outer,
                  color: Color.fromARGB(255, 155, 155, 222),
                  spreadRadius: 0)
            ]),
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                hospital,
                style: GoogleFonts.openSans(
                    fontSize: 18.sp, fontWeight: FontWeight.w600),
              ),
              Text(
                'Emergency Room',
                style: GoogleFonts.openSans(fontSize: 12.sp),
              ),
              Row(
                children: [
                  Text(
                    kilometer,
                    style: GoogleFonts.openSans(fontSize: 10.sp),
                  ),
                  SpacingManager.w10,
                  Text(
                    time,
                    style: GoogleFonts.openSans(fontSize: 10.sp),
                  ),
                ],
              ),
            ],
          ),
          trailing: SizedBox(
            width: 70.w,
            child: Row(
              children: [
                SvgPicture.asset(Assets.messageIcon),
                SpacingManager.w10,
                SvgPicture.asset(Assets.callIcon)
              ],
            ),
          ),
        ));
  }
}
