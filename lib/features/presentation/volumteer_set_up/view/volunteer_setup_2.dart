import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifeline/core/constant/assets_location.dart';
import 'package:lifeline/core/constant/color.dart';
import 'package:lifeline/core/constant/spacing.dart';
import 'package:lifeline/features/presentation/pages/nearby_hospiatal/view/near_by_hospital_map.dart';
import 'package:lifeline/features/presentation/volumteer_set_up/view/volunteer_setup_3.dart';
import 'package:lifeline/features/widget/custom_button.dart';
import 'package:lifeline/features/widget/custom_txt_field.dart';
import 'package:lifeline/features/widget/page_transition.dart';

class VolunteerSetUp2 extends StatelessWidget {
  VolunteerSetUp2({super.key});

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SpacingManager.h48,
        const AppBarWidget(label: 'Let\'s get you started'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Text(
                'Cras laoreet non ex quis iaculis. Duis ligula dolor Cras laoreet non ex quis iaculis. Duis ligula dolor',
                style: GoogleFonts.openSans(
                    color: AppColors.greyColor, fontSize: 12.sp),
              ),
              SpacingManager.h18,
              const UploadWidget(title: 'Image/Photo'),
              SpacingManager.h10,
              const UploadWidget(title: 'Medical License'),
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
              ),
              PrimaryButton(
                onPressed: () {
                  Navigator.push(context, SizeTransition2(VolunteerSetUp3()));
                },
                buttonTitle: 'Next',
                enableButton: true,
                buttonColor: HexColors.blue10,
              )
            ],
          ),
        )
      ],
    ));
  }
}

class UploadWidget extends StatelessWidget {
  const UploadWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.openSans(),
        ),
        SpacingManager.h10,
        Container(
          height: 220.h,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.greyColor, width: 1.5)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Assets.uploadIcon),
                SpacingManager.h10,
                Text(
                  'Click to upload image \nRecommended dimension: 600 x 320 px',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                    color: AppColors.greyColor,
                    fontSize: 11.sp,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
