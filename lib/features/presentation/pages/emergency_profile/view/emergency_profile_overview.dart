// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:lifeline/core/constant/color.dart';
import 'package:lifeline/core/constant/spacing.dart';
import 'package:lifeline/features/presentation/pages/emergency_profile/state/emergency_profile_state.dart';
import 'package:lifeline/features/presentation/pages/nearby_hospiatal/view/near_by_hospital_map.dart';
import 'package:lifeline/features/widget/custom_button.dart';

class OverViewEmergencyProfile extends ConsumerWidget {
  const OverViewEmergencyProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final res = ref.watch(emergencyProfileState);
    return Scaffold(
      body: Column(
        children: [
          SpacingManager.h48,
          const AppBarWidget(label: 'Your Emergency Profile'),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Medical Information',
                          style: GoogleFonts.openSans(),
                        ),
                        Text(
                          'Edit',
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.bold,
                              color: HexColors.blue10),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 10.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(width: 1, color: AppColors.greyColor)),
                      child: Column(
                        children: [
                          const ContentInfoWidget(
                              leading: 'Condition:', info: 'Asthma, Diabetes'),
                          SpacingManager.h10,
                          const ContentInfoWidget(
                              leading: 'Allergies:', info: 'Peanut'),
                          SpacingManager.h10,
                          const ContentInfoWidget(
                              leading: 'Medications:',
                              info: 'Metformin 500mg (daily)'),
                        ],
                      ),
                    )
                  ],
                ),
                SpacingManager.h18,
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Location',
                          style: GoogleFonts.openSans(),
                        ),
                        Text(
                          'Edit',
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.bold,
                              color: HexColors.blue10),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 10.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(width: 1, color: AppColors.greyColor)),
                      child: Column(
                        children: [
                          ContentInfoWidget(
                              leading: 'Home Address:',
                              info: res.homeAddressController.text
                              // 'CMF hostel, Awo road, along \nbarth road, UI, Ibadan'
                              ),
                          SpacingManager.h10,
                          ContentInfoWidget(
                              leading: 'Preffered Hospital:',
                              info: res.prefferedAddressController.text),
                        ],
                      ),
                    )
                  ],
                ),
                SpacingManager.h18,
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Contact Details',
                          style: GoogleFonts.openSans(),
                        ),
                        Text(
                          'Edit',
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.bold,
                              color: HexColors.blue10),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 10.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(width: 1, color: AppColors.greyColor)),
                      child: Column(
                        children: [
                          ContentInfoWidget(
                              leading: 'Name:',
                              info: res.firstNameController.text),
                          SpacingManager.h10,
                          const ContentInfoWidget(
                              leading: 'Relationship:', info: 'Sister'),
                          SpacingManager.h10,
                          ContentInfoWidget(
                              leading: 'Phone Number:',
                              info: res.phoneNumerController.text),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5,
                ),
                PrimaryButton(
                  onPressed: () {},
                  buttonTitle: 'Save',
                  buttonColor: HexColors.blue10,
                  enableButton: true,
                ),
                SpacingManager.h24,
                PrimaryButton(
                  onPressed: () {},
                  buttonTitle: 'Share',
                  buttonColor: AppColors.white,
                  enableButton: true,
                  borderColor: HexColors.blue10,
                  buttonTitleTextStyle: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold, color: HexColors.blue10),
                  borderWidth: 2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ContentInfoWidget extends StatelessWidget {
  final String leading;
  final String info;
  const ContentInfoWidget({
    Key? key,
    required this.leading,
    required this.info,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          leading,
          style:
              GoogleFonts.openSans(color: AppColors.greyColor, fontSize: 14.sp),
        ),
        SpacingManager.w20,
        Text(
          info,
          style: GoogleFonts.openSans(fontSize: 14.sp),
        ),
      ],
    );
  }
}
