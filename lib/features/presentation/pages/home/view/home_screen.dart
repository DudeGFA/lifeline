import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifeline/core/constant/assets_location.dart';
import 'package:lifeline/core/constant/color.dart';
import 'package:lifeline/core/constant/spacing.dart';
import 'package:lifeline/core/routes/route_generator.dart';
import 'package:lifeline/features/presentation/pages/ai_emergency_call/view/ai_emergency_call.dart';
import 'package:lifeline/features/presentation/pages/declare_emergency.dart/view/declare_emergency_view.dart';
import 'package:lifeline/features/presentation/pages/emergency_practitioner.dart/view/emergency_practitioner.dart';
import 'package:lifeline/features/presentation/pages/emergency_profile/view/emergency_profile.dart';
import 'package:lifeline/features/presentation/pages/emergencyaid_guide_view/view/emergeency_aid_guide.dart';
import 'package:lifeline/features/presentation/pages/home/widget/feature_card.dart';
import 'package:lifeline/features/presentation/pages/nearby_hospiatal/view/near_by_hospital_map.dart';
import 'package:lifeline/features/presentation/pages/onboarding/screens/state/locaton_state.dart';
import 'package:lifeline/features/presentation/volumteer_set_up/view/volunteer_setup_1.dart';
import 'package:lifeline/features/widget/page_transition.dart';

import '../../../../../core/constant/dimensions.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenConsumerState();
}

class _HomeScreenConsumerState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final state = ref.watch(locationProvider);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi,',
              style: GoogleFonts.openSans(
                  fontSize: 14.sp, color: AppColors.greyColor),
            ),
            // Row(
            //   children: [
            Text(
              'Welcome👋',
              style: GoogleFonts.openSans(fontSize: 16.sp),
            ),
            //   ],
            // ),
          ],
        ),
        actions: [
          Text(
            'Your Route',
            style: GoogleFonts.openSans(
                fontSize: 11.sp, color: AppColors.greyColor),
          ),
          SpacingManager.w10,
          GestureDetector(
            onTap: () => AppRoute.navigateToRoute(NearbyHospitalMap()),
            child: Container(
                // height: 34.h,
                // width: 34.w,
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                    color: AppColors.blueGrey,
                    borderRadius: BorderRadius.circular(1000)),
                child: SvgPicture.asset(
                  Assets.route,
                )),
          ),
          SpacingManager.w10,
          GestureDetector(
            onTap: () {
              AppRoute.navigateToRoute(const EmergencyProfile());
            },
            child: Container(
                // height: 34.h,
                // width: 34.w,
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                    color: AppColors.blueGrey,
                    borderRadius: BorderRadius.circular(1000)),
                child: SvgPicture.asset(
                  Assets.addPerson,
                )),
          ),
          SpacingManager.w10,
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpacingManager.h14,
              Text(
                'Save a Life Now',
                style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold, fontSize: 20.sp),
              ),
              Text(
                'Gain the knowledge and skills needed to confidently respond in emergencies',
                style: GoogleFonts.openSans(
                    fontSize: 12.sp, color: AppColors.greyColor),
              ),
              SpacingManager.h14,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FeatureCard(
                      label: 'Declare an Emergency',
                      image: Assets.call,
                      onTap: () {
                        Navigator.push(
                            context, SizeTransition2(const DeclareEmergency()));
                      },
                    ),
                    FeatureCard(
                      label: 'Talk to AI Emergency Advisor',
                      image: Assets.speaker,
                      onTap: () {
                        AppRoute.navigateToRoute(const AIEmergencyCall());
                      },
                    ),
                  ],
                ),
              ),
              SpacingManager.h14,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FeatureCard(
                      label: 'Call an Emergency Guide',
                      image: Assets.docInstrument,
                      onTap: () {
                        AppRoute.navigateToRoute(CallEmergencyPracView());
                      },
                    ),
                    FeatureCard(
                      label: 'Learn Emergency Aid guide',
                      image: Assets.book,
                      onTap: () {
                        AppRoute.navigateToRoute(EmergencyAidGuidView());
                      },
                    ),
                  ],
                ),
              ),
              SpacingManager.h14,
              GestureDetector(
                onTap: () {
                  Navigator.push(context, SizeTransition2(VolunteerSetUp1()));
                },
                child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(Assets.banner)),
              ),
              SpacingManager.h18,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'ABOUT THE APP',
                    style: GoogleFonts.openSans(),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 1.w),
                    color: AppColors.blackColor,
                  ),
                  Text(
                    'HOW TO USE?',
                    style: GoogleFonts.openSans(),
                  ),
                ],
              ),
              SpacingManager.h18,
            ],
          ),
        ),
      ),
    );
  }
}
