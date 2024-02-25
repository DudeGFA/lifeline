import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifeline/core/constant/color.dart';
import 'package:lifeline/core/constant/spacing.dart';
import 'package:lifeline/features/presentation/pages/emergency_profile/state/emergency_profile_state.dart';
import 'package:lifeline/features/presentation/pages/emergency_profile/view/primary_emergency_location.dart';
import 'package:lifeline/features/presentation/pages/emergency_profile/view/primary_medical2_conditon.dart';
import 'package:lifeline/features/presentation/pages/nearby_hospiatal/view/near_by_hospital_map.dart';
import 'package:lifeline/features/widget/custom_button.dart';
import 'package:lifeline/features/widget/custom_txt_field.dart';
import 'package:lifeline/features/widget/page_transition.dart';

class PrimaryEmergencyCondition extends ConsumerWidget {
  PrimaryEmergencyCondition({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(emergencyProfileState);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SpacingManager.h48,
            const AppBarWidget(label: 'Medical Information'),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
              child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  shrinkWrap: true,
                  children: [
                    Text(
                      'Cras laoreet non ex quis iaculis. Duis ligula dolor Cras laoreet non ex quis iaculis. Duis ligula dolor',
                      style: GoogleFonts.openSans(
                          color: AppColors.greyColor, fontSize: 12.sp),
                    ),
                    SpacingManager.h19,
                    AppTextField(
                      label: 'Condtion',
                      textEditingController: notifier.conditonController,
                      hintText: 'Enter condition',
                      addBorder: true,
                    ),
                    SpacingManager.h18,
                    AppCustomDropDownCard(
                      onTap: () {},
                      hinText: 'Select your allergies',
                      label: 'Allergies',
                    ),
                    SpacingManager.h18,
                    AppTextField(
                      label: 'Medications Name',
                      textEditingController: notifier.medicalNameController,
                      hintText: 'Enter medications name',
                      addBorder: true,
                    ),
                    SpacingManager.h18,
                    AppTextField(
                      label: 'Medications Dosage',
                      textEditingController: notifier.medicalDosageController,
                      hintText: 'Enter medications dosage',
                      addBorder: true,
                    ),
                    SpacingManager.h18,
                    AppTextField(
                      label: 'Medications Start Date',
                      textEditingController:
                          notifier.medicalStartDateController,
                      hintText: 'Enter medications start date',
                      addBorder: true,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 12,
                    ),
                    PrimaryButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            SizeTransition2(
                                const PrimaryEmergencyCondition2()));
                      },
                      buttonTitle: 'Next',
                      enableButton: true,
                      buttonColor: HexColors.blue10,
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
