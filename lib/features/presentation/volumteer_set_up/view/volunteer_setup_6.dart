import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifeline/core/constant/color.dart';
import 'package:lifeline/core/constant/spacing.dart';
import 'package:lifeline/features/presentation/pages/nearby_hospiatal/view/near_by_hospital_map.dart';
import 'package:lifeline/features/presentation/volumteer_set_up/view/form_submission.dart';
import 'package:lifeline/features/presentation/volumteer_set_up/view/volunteer_setup_2.dart';
import 'package:lifeline/features/widget/custom_button.dart';
import 'package:lifeline/features/widget/custom_txt_field.dart';
import 'package:lifeline/features/widget/page_transition.dart';

class VolunteerSetUp6 extends StatefulWidget {
  VolunteerSetUp6({super.key});

  @override
  State<VolunteerSetUp6> createState() => _VolunteerSetUp6State();
}

class _VolunteerSetUp6State extends State<VolunteerSetUp6> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  bool isVisible1 = false;
  bool isVisible2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SpacingManager.h48,
        const AppBarWidget(label: 'Create an Account'),
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
                textEditingController: emailController,
                label: 'Email Address',
                hintText: 'Enter email address',
                addBorder: true,
              ),
              SpacingManager.h10,
              AppTextField(
                textEditingController: emailController,
                label: 'Create Username',
                hintText: 'Enter username',
                addBorder: true,
              ),
              SpacingManager.h10,
              AppTextField(
                textEditingController: emailController,
                label: 'Create Password',
                hintText: 'Enter password',
                addBorder: true,
                obscureText: isVisible1,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isVisible1 = !isVisible1;
                      });
                    },
                    icon: Icon(
                        isVisible1 ? Icons.visibility : Icons.visibility_off)),
              ),
              SpacingManager.h10,
              AppTextField(
                textEditingController: emailController,
                label: 'Confirm Password',
                hintText: 'Enter password',
                addBorder: true,
                obscureText: isVisible2,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isVisible2 = !isVisible2;
                      });
                    },
                    icon: Icon(
                        isVisible2 ? Icons.visibility : Icons.visibility_off)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
              ),
              PrimaryButton(
                onPressed: () {
                  Navigator.push(context, SizeTransition2( const FormSubmission()));
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
