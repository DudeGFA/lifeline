import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifeline/core/constant/assets_location.dart';
import 'package:lifeline/core/constant/color.dart';
import 'package:lifeline/core/constant/spacing.dart';
import 'package:lifeline/features/presentation/pages/nearby_hospiatal/view/near_by_hospital_map.dart';

class AIEmergencyCall extends StatefulWidget {
  const AIEmergencyCall({super.key});

  @override
  State<AIEmergencyCall> createState() => _AIEmergencyCallState();
}

class _AIEmergencyCallState extends State<AIEmergencyCall> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SpacingManager.h48,
          const AppBarWidget(label: 'Speak to AI Emergency Advisor'),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2.5,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isLoading = !isLoading;
                    });
                  },
                  child: Container(
                    height: 90.h,
                    width: 50.w,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: isLoading
                              ? HexColors.blue10
                              : AppColors.greyColor,
                        ),
                        // borderRadius: BorderRadius.circular(1000),
                        shape: BoxShape.circle),
                    child: SvgPicture.asset(
                      Assets.speaker,
                      color: isLoading ? HexColors.blue10 : AppColors.greyColor,
                    ),
                  ),
                ),
                isLoading
                    ? Text(
                        'Listening...',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                            fontSize: 12.sp,
                            color: isLoading
                                ? HexColors.blue10
                                : AppColors.greyColor),
                      )
                    : Text(
                        'Tap the microphone icon to activate voice input. Clearly state your health concerns or questions. Wait for the AI to analyze and respond to your queries. If needed, follow any additional prompts or inquiries from the AI',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                            fontSize: 12.sp,
                            color: isLoading
                                ? HexColors.blue10
                                : AppColors.greyColor),
                      ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height / 2,
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
