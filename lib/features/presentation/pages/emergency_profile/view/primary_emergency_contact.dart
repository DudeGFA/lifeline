import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifeline/core/constant/color.dart';
import 'package:lifeline/core/constant/dimensions.dart';
import 'package:lifeline/core/constant/spacing.dart';
import 'package:lifeline/features/presentation/pages/emergency_profile/state/emergency_profile_state.dart';
import 'package:lifeline/features/presentation/pages/emergency_profile/view/primary_emergency_location.dart';
import 'package:lifeline/features/presentation/pages/nearby_hospiatal/view/near_by_hospital_map.dart';
import 'package:lifeline/features/widget/custom_button.dart';
import 'package:lifeline/features/widget/custom_txt_field.dart';
import 'package:lifeline/features/widget/page_transition.dart';

class PrimaryEmergencyContact extends ConsumerWidget {
  PrimaryEmergencyContact({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(emergencyProfileState);
    SizeConfig.init(context);
    return Scaffold(
      body: Column(
        children: [
          SpacingManager.h48,
          const AppBarWidget(label: 'Primary Emergency Contact'),
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
                    label: 'First name',
                    textEditingController: notifier.firstNameController,
                    hintText: 'Enter first name',
                    addBorder: true,
                  ),
                  SpacingManager.h18,
                  AppCustomDropDownCard(
                    onTap: () {},
                    hinText: 'Select relationship',
                    label: 'Relationship',
                  ),
                  SpacingManager.h18,
                  AppTextField(
                    label: 'Phone number',
                    textEditingController: notifier.phoneNumerController,
                    hintText: 'Enter phone number',
                    addBorder: true,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                  ),
                  PrimaryButton(
                    onPressed: () {
                      Navigator.push(
                          context, SizeTransition2(PrimaryEmergencyLocation()));
                    },
                    buttonTitle: 'Next',
                    enableButton: true,
                    buttonColor: HexColors.blue10,
                  )
                ]),
          )
        ],
      ),
    );
  }
}
