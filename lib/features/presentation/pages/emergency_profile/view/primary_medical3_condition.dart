import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifeline/core/constant/color.dart';
import 'package:lifeline/core/constant/spacing.dart';
import 'package:lifeline/features/presentation/pages/emergency_profile/state/emergency_profile_state.dart';
import 'package:lifeline/features/presentation/pages/emergency_profile/view/call_for_emergency.dart';
import 'package:lifeline/features/presentation/pages/nearby_hospiatal/view/near_by_hospital_map.dart';
import 'package:lifeline/features/widget/custom_button.dart';
import 'package:lifeline/features/widget/custom_txt_field.dart';
import 'package:lifeline/features/widget/page_transition.dart';

class PrimaryEmergencyCondition3 extends ConsumerWidget {
  PrimaryEmergencyCondition3({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final res = ref.watch(emergencyProfileState);
    return Scaffold(
      body: Column(
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
                    textEditingController: res.infoController,
                    hintText: 'Enter info',
                    label: 'In Case of Emergency Information',
                    addBorder: true,
                  ),
                  SpacingManager.h18,
                  AppCustomDropDownCard(
                    onTap: () {},
                    hinText: 'Select preffered language',
                    label: 'Preffered Language',
                  ),
                  SpacingManager.h18,
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2.5,
                  ),
                  PrimaryButton(
                    onPressed: () {
                      Navigator.push(
                          context, SizeTransition2(const CallForEmergency()));
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
