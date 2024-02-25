// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:lifeline/core/constant/assets_location.dart';
import 'package:lifeline/core/constant/color.dart';
import 'package:lifeline/core/constant/spacing.dart';
import 'package:lifeline/core/routes/route_generator.dart';
import 'package:lifeline/features/presentation/pages/emergency_practitioner.dart/view/video_emergency_practitioner.dart';
import 'package:lifeline/features/presentation/pages/nearby_hospiatal/view/near_by_hospital_map.dart';
import 'package:lifeline/features/widget/custom_button.dart';

class CallEmergencyPracView extends StatelessWidget {
  CallEmergencyPracView({super.key});

  final List<EmergencyDoctorModel> fetchDoctor =
      EmergencyDoctorModel.fetchDocor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SpacingManager.h48,
          const AppBarWidget(label: 'Available Emrgency Practitioner'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  'Our diverse team of skilled and compassionate healthcare professionals is here to provide personalized care and support tailored to your unique needs.',
                  style: GoogleFonts.openSans(
                      fontSize: 10.sp, color: AppColors.greyColor),
                ),
                SpacingManager.h13,
                fetchDoctor.isEmpty
                    ? const NoEmergencyPracView()
                    : SizedBox(
                        height: MediaQuery.of(context).size.height / 1.25,
                        child: ListView.builder(
                            padding: const EdgeInsets.symmetric(vertical: 0),
                            shrinkWrap: true,
                            itemCount: fetchDoctor.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  AppRoute.navigateToRoute(
                                      VideoCallEmegercyPratitioner(
                                    index: index,
                                    name: fetchDoctor[index].name,
                                  ));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 10.h),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30.r, vertical: 20.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9),
                                    border: Border.all(
                                        color: AppColors.grey20, width: 2),
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(fetchDoctor[index].image),
                                      SpacingManager.w10,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(fetchDoctor[index].name,
                                              style: GoogleFonts.openSans(
                                                  fontWeight: FontWeight.bold)),
                                          Text(fetchDoctor[index].profession,
                                              style: GoogleFonts.openSans()),
                                        ],
                                      ),
                                      const Spacer(),
                                      Icon(
                                        Icons.call,
                                        size: 20.r,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class EmergencyDoctorModel {
  String image;
  String name;
  String profession;
  EmergencyDoctorModel({
    required this.image,
    required this.name,
    required this.profession,
  });

  static List<EmergencyDoctorModel> fetchDocor = [
    EmergencyDoctorModel(
        name: 'Ronaldo Richard',
        profession: 'Cardiologists',
        image: Assets.doctorE),
    EmergencyDoctorModel(
        name: 'Esther Richard',
        profession: 'Gynecologists',
        image: Assets.doctor2),
    EmergencyDoctorModel(
        name: 'Leslie Alexander',
        profession: 'Physiotherapists',
        image: Assets.doctor3),
    EmergencyDoctorModel(
        name: 'Robert Fox', profession: 'Pediatricians', image: Assets.doctor4),
    EmergencyDoctorModel(
        name: 'Wade Warren',
        profession: 'Cardiologists',
        image: Assets.doctor5),
    EmergencyDoctorModel(
        name: 'Kathryn Murphy',
        profession: 'Gastroenterologists',
        image: Assets.doctor6),
    // EmergencyDoctorModel(
    //     name: 'Ronaldo Richard', profession: 'Cardiologists', image: ''),
    // EmergencyDoctorModel(
    //     name: 'Ronaldo Richard', profession: 'Cardiologists', image: ''),
    // EmergencyDoctorModel(
    //     name: 'Ronaldo Richard', profession: 'Cardiologists', image: ''),
    // EmergencyDoctorModel(
    //     name: 'Ronaldo Richard', profession: 'Cardiologists', image: ''),
    // EmergencyDoctorModel(
    //     name: 'Ronaldo Richard', profession: 'Cardiologists', image: ''),
  ];
}

class NoEmergencyPracView extends StatelessWidget {
  const NoEmergencyPracView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
            ),
            Image.asset(Assets.instrument),
            SpacingManager.h10,
            Text(
              'We\'re sorry, but it seems that all our first aider are currently occupied or unavailable. Your health is important to us, and we apologize for any inconvenience. While waiting, feel free to speak to our AI feature for preliminary guidance',
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                  fontSize: 12.sp, color: AppColors.greyColor),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
            ),
            // Spacer(),
            PrimaryButton(
              onPressed: () {},
              enableButton: true,
              buttonColor: HexColors.blue10,
              buttonTitle: 'Talk to AI Emergency Advisor',
            ),
            SpacingManager.h18,
            PrimaryButton(
              onPressed: () {},
              enableButton: true,
              buttonColor: AppColors.white,
              buttonTitle: 'Nearby Hospital Map',
              borderColor: HexColors.blue10,
              buttonTitleTextStyle: GoogleFonts.openSans(
                  color: HexColors.blue10, fontWeight: FontWeight.bold),
              borderWidth: 2,
            ),
          ],
        ),
      ),
    );
  }
}
