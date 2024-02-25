import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifeline/core/constant/color.dart';
import 'package:lifeline/core/constant/spacing.dart';
import 'package:lifeline/features/presentation/pages/nearby_hospiatal/view/near_by_hospital_map.dart';
import 'package:lifeline/features/presentation/volumteer_set_up/view/volunteer_setup_2.dart';
import 'package:lifeline/features/widget/custom_button.dart';
import 'package:lifeline/features/widget/custom_txt_field.dart';
import 'package:lifeline/features/widget/page_transition.dart';

class VolunteerSetUp1 extends StatelessWidget {
  VolunteerSetUp1({super.key});

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
              AppTextField(
                label: 'First Name',
                hintText: 'Enter first name',
                textEditingController: firstNameController,
                addBorder: true,
              ),
              SpacingManager.h14,
              AppTextField(
                label: 'Last Name',
                hintText: 'Enter last name',
                textEditingController: lastNameController,
                addBorder: true,
              ),
              SpacingManager.h14,
              AppCustomDropDownCard(
                onTap: () {},
                hinText: 'Select your country',
                label: 'Country',
              ),
              SpacingManager.h14,
              AppCustomDropDownCard(
                onTap: () {},
                hinText: 'Select your state',
                label: 'State',
              ),
              SpacingManager.h14,
              AppCustomDropDownCard(
                onTap: () {},
                hinText: 'Select your language',
                label: 'Language',
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 8,
              ),
              PrimaryButton(
                onPressed: () {
                    Navigator.push(context, SizeTransition2( VolunteerSetUp2()));
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
