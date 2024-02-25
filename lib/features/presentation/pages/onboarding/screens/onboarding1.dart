import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lifeline/features/presentation/pages/nearby_hospiatal/state/near_by_state.dart';
import 'package:lifeline/features/presentation/pages/onboarding/screens/onboarding2.dart';
import 'package:lifeline/features/presentation/pages/onboarding/screens/state/locaton_state.dart';
import 'package:lifeline/features/widget/custom_button.dart';

import '../../../../../core/constant/assets_location.dart';
import '../../../../../core/constant/color.dart';
import '../../../../../core/constant/dimensions.dart';
import '../../../../../core/constant/spacing.dart';
import '../../../../../core/constant/strings.dart';
import '../../../../widget/custom_text.dart';
import '../../../../widget/page_transition.dart';

class Onboarding1 extends ConsumerStatefulWidget {
  const Onboarding1({super.key});

  @override
  ConsumerState<Onboarding1> createState() => _Onboarding1ConsumerState();
}

class _Onboarding1ConsumerState extends ConsumerState<Onboarding1> {
  @override
  Widget build(BuildContext context) {
   
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpacingManager.h180,
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(56)),
            child: SvgPicture.asset(Assets.location),
          ),
          SpacingManager.h48,
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(99)),
            child: customTextNunitoSansCenter(
                colorName: HexColors.gay80,
                weight: FontWeight.w600,
                fontSize: 14,
                inputText: StaticText.nerbyHos),
          ),
          SpacingManager.h24,
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(39)),
            child: customGeneralTextNunitoSansCenter(
                colorName: HexColors.gay80,
                weight: FontWeight.w400,
                fontSize: 12,
                inputText: StaticText.accesslocale),
          ),
          SpacingManager.h40,
          PrimaryButton(
            onPressed: () async {
              final locationProviderRef = ref.read(locationProvider.notifier);
              final newPosition =
                  await locationProviderRef.getUserLocation(context);

              if (mounted) {
                // Check if the widget is still mounted before updating the state
                // ref
                //     .read(nearbyStateNotiferProvider.notifier)
                //     .fetchNearByHospital();
                // locationProviderRef.currentLocation = newPosition;
                // await locationProviderRef.getAddresFromCoordinate();
                // print(locationProviderRef.currentLocation!.latitude);
                // print(locationProviderRef.currentLocation!.longitude);
              }
            },
            buttonTitle: StaticText.allow,
            buttonColor: HexColors.blue10,
            buttonHeight: getProportionateScreenHeight(48),
            butttonWidth: getProportionateScreenWidth(327),
            borderRadius: 12,
            splashColor: AppColors.grey10,
            buttonTitleTextStyle: const TextStyle(
                color: AppColors.primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w400),
            enableButton: true,
          ),
          SpacingManager.h32,
          PrimaryButton(
            borderColor: HexColors.blue10,
            borderWidth: 1,
            onPressed: () {
              Navigator.push(context, SizeTransition2(const Onboarding2()));
            },
            buttonTitle: StaticText.later,
            buttonColor: AppColors.primaryColor,
            buttonHeight: getProportionateScreenHeight(48),
            butttonWidth: getProportionateScreenWidth(327),
            borderRadius: 12,
            splashColor: AppColors.grey10,
            buttonTitleTextStyle: TextStyle(
                color: HexColors.blue10,
                fontSize: 14,
                fontWeight: FontWeight.w400),
            enableButton: true,
          ),
        ],
      ),
    );
  }
}
