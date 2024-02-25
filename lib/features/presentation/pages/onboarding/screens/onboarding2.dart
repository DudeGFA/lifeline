import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lifeline/features/presentation/pages/onboarding/screens/onboarding3.dart';
import 'package:lifeline/features/presentation/pages/onboarding/screens/state/locaton_state.dart';
import 'package:lifeline/features/widget/custom_button.dart';

import '../../../../../core/constant/assets_location.dart';
import '../../../../../core/constant/color.dart';
import '../../../../../core/constant/dimensions.dart';
import '../../../../../core/constant/spacing.dart';
import '../../../../../core/constant/strings.dart';
import '../../../../widget/custom_text.dart';
import '../../../../widget/page_transition.dart';

class Onboarding2 extends ConsumerWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            child: SvgPicture.asset(Assets.mic),
          ),
          SpacingManager.h48,
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(99)),
            child: customTextNunitoSansCenter(
                colorName: HexColors.gay80,
                weight: FontWeight.w600,
                fontSize: 14,
                inputText: StaticText.accessMic),
          ),
          SpacingManager.h24,
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(39)),
            child: customGeneralTextNunitoSansCenter(
                colorName: HexColors.gay80,
                weight: FontWeight.w400,
                fontSize: 12,
                inputText: StaticText.accessLife),
          ),
          SpacingManager.h40,
          PrimaryButton(
            onPressed: () {
              ref
                  .read(locationProvider.notifier)
                  .checkAndRequestAudioPermission(context);
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
              Navigator.push(context, SizeTransition2(const Onboarding3()));
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
