import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/dimensions.dart';
import '../../../../core/constant/strings.dart';
import '../../../widget/custom_text.dart';
import '../onboarding/screens/onboarding1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigate();
    super.initState();
  }

  void navigate() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Onboarding1()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(123)),
              child: customTextNunitoSansCenter(
                  colorName: HexColors.blue10,
                  weight: FontWeight.w700,
                  fontSize: 34.sp,
                  inputText: StaticText.lifeline),
            ),
            customTextNunitoSansCenter(
                colorName: HexColors.blue10,
                weight: FontWeight.w400,
                fontSize: 15.sp,
                inputText: StaticText.companion),
          ],
        ));
  }
}
