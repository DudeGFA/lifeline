import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifeline/core/constant/assets_location.dart';
import 'package:lifeline/core/constant/color.dart';
import 'package:lifeline/core/constant/spacing.dart';
import 'package:lifeline/features/presentation/pages/nearby_hospiatal/view/near_by_hospital_map.dart';

class CallForEmergency2 extends StatefulWidget {
  CallForEmergency2({super.key});

  @override
  State<CallForEmergency2> createState() => _CallForEmergency2State();
}

class _CallForEmergency2State extends State<CallForEmergency2> {
  bool isCalling = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SpacingManager.h48,
          const AppBarWidget(label: 'Emergency Call'),
          SpacingManager.h19,
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            child: Column(
              children: [
                Text(
                  'If you are experiencing a medical emergency or need immediate assistance, please use the phone icon below to call emergency service',
                  style: GoogleFonts.openSans(
                      fontSize: 12, color: AppColors.greyColor),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isCalling = !isCalling;
                    });
                  },
                  child: isCalling
                      ? Container(
                          // height: 140.h,
                          width: 90.w,
                          padding: const EdgeInsets.all(10),
                          // decoration: BoxDecoration(
                          //     border: Border.all(
                          //       color: HexColors.blue10,
                          //     ),
                          //     // borderRadius: BorderRadius.circular(1000),
                          //     shape: BoxShape.circle),
                          child: Image.asset(
                            Assets.calling,
                            width: 500.h,
                            color: HexColors.blue10,
                          ),
                        )
                      : Container(
                          height: 100.h,
                          width: 70.w,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: HexColors.blue10,
                              ),
                              // borderRadius: BorderRadius.circular(1000),
                              shape: BoxShape.circle),
                          child: Image.asset(
                            Assets.cancelCall,
                            width: 500.h,
                            color: HexColors.blue10,
                          ),
                        ),
                ),
                SpacingManager.h10,
                isCalling
                    ? Text(
                        'Connecting...',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                            color: HexColors.blue10, fontSize: 14.sp),
                      )
                    : Text(
                        'Please only use this feature in genuine emergency situations. Misuse of emergency services can delay help for those in need',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                            color: AppColors.greyColor, fontSize: 12.sp),
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}
