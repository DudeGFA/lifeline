import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifeline/core/constant/assets_location.dart';
import 'package:lifeline/core/constant/color.dart';
import 'package:lifeline/core/constant/spacing.dart';
import 'package:lifeline/core/routes/route_generator.dart';
import 'package:lifeline/features/presentation/pages/emergency_profile/view/call_for_emergency_2.dart';
import 'package:lifeline/features/presentation/pages/emergency_profile/view/emergency_profile_overview.dart';
import 'package:lifeline/features/widget/custom_button.dart';
import 'package:lifeline/features/widget/page_transition.dart';

class CallForEmergency extends StatefulWidget {
  const CallForEmergency({super.key});

  @override
  State<CallForEmergency> createState() => _CallForEmergencyCallState();
}

class _CallForEmergencyCallState extends State<CallForEmergency> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SpacingManager.h48,
          // const AppBarWidget(label: 'Speak to AI Emergency Advisor'),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2.5,
                ),
                Container(
                  height: 90.h,
                  width: 50.w,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.greyColor,
                      ),
                      // borderRadius: BorderRadius.circular(1000),
                      shape: BoxShape.circle),
                  child: Image.asset(
                    Assets.cancelCall,
                    width: 500.h,
                    color: AppColors.greyColor,
                  ),
                ),
                Text(
                  'Sharing your medical information and preferences can save valuable time and ensure you receive the right treatment',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                      fontSize: 12.sp,
                      color:
                          isLoading ? HexColors.blue10 : AppColors.greyColor),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5.5,
                ),
                PrimaryButton(
                  onPressed: () {
                    Navigator.push(
                        context, SizeTransition2(CallForEmergency2()));
                  },
                  buttonColor: HexColors.blue10,
                  enableButton: true,
                  buttonTitle: 'Call for Emergency',
                ),
                SpacingManager.h18,
                PrimaryButton(
                  onPressed: () {
                    AppRoute.navigateToRoute(const OverViewEmergencyProfile());
                  },
                  buttonColor: AppColors.white,
                  enableButton: true,
                  buttonTitle: 'Preview',
                  borderColor: HexColors.blue10,
                  borderWidth: 2,
                  buttonTitleTextStyle: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold, color: HexColors.blue10),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
