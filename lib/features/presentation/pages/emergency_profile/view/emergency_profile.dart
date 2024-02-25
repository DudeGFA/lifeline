import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifeline/core/constant/assets_location.dart';
import 'package:lifeline/core/constant/color.dart';
import 'package:lifeline/core/constant/spacing.dart';
import 'package:lifeline/core/routes/route_generator.dart';
import 'package:lifeline/features/presentation/pages/emergency_profile/view/primary_emergency_contact.dart';
import 'package:lifeline/features/presentation/pages/home/view/home_screen.dart';
import 'package:lifeline/features/presentation/pages/nearby_hospiatal/view/near_by_hospital_map.dart';
import 'package:lifeline/features/widget/custom_button.dart';
import 'package:lifeline/features/widget/page_transition.dart';

class EmergencyProfile extends StatelessWidget {
  const EmergencyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SpacingManager.h48,
          const AppBarWidget(label: 'Set up Emergency Profile'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                ),
                Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.greyColor, width: 2),
                        shape: BoxShape.circle),
                    child: SvgPicture.asset(
                      Assets.addPerson,
                      height: 65.h,
                      color: AppColors.greyColor,
                    )),
                SpacingManager.h24,
                Text(
                  'Sharing your medical information and preferences can save valuable time and ensure you receive the right treatment',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                      color: AppColors.greyColor, fontSize: 12.sp),
                ),
                SpacingManager.h48,
                PrimaryButton(
                  onPressed: () {
                    // AppRoute.navigateToRoute(
                    //     SizeTransition2(const PrimaryEmergencyContact()));
                    Navigator.push(
                        context, SizeTransition2(PrimaryEmergencyContact()));
                  },
                  buttonTitle: 'Set up now',
                  enableButton: true,
                  buttonColor: HexColors.blue10,
                ),
                SpacingManager.h19,
                PrimaryButton(
                  onPressed: () {
                    AppRoute.navigateAndRemoveUntilRoute(const HomeScreen());
                  },
                  enableButton: true,
                  buttonColor: AppColors.white,
                  borderColor: HexColors.blue10,
                  buttonTitleTextStyle: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold, color: HexColors.blue10),
                  borderWidth: 2,
                  buttonTitle: 'Skip for now',
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
