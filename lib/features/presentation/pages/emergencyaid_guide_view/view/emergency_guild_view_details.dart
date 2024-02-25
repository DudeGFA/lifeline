import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifeline/core/constant/assets_location.dart';
import 'package:lifeline/core/constant/color.dart';
import 'package:lifeline/core/constant/spacing.dart';
import 'package:lifeline/features/presentation/pages/emergencyaid_guide_view/model/emergency_aid_guide_model.dart';
import 'package:lifeline/features/presentation/pages/nearby_hospiatal/view/near_by_hospital_map.dart';

// class EmergencyAidGuidViewDetails extends StatelessWidget {
//   const EmergencyAidGuidViewDetails({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           SpacingManager.h48,
//           Stack(
//             children: [
//               Image.asset(Assets.background, fit: BoxFit.c,),
//               AppBarWidget(
//                 label: '',
//               ),
//             ],
//           ),
//           Container(
//             alignment: Alignment.topCenter,
//             height: MediaQuery.of(context).size.height / 1.5,
//             decoration: BoxDecoration(color: HexColors.blue10),
//           )
//         ],
//       ),
//     );
//   }
// }

class EmergencyAidGuidViewDetails extends StatelessWidget {
  EmergencyAidGuidViewDetails({Key? key, required this.index})
      : super(key: key);
  final List<EmergencyAidModel> fetchList = EmergencyAidModel.getEmergencyList;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(fetchList[index].image),
                fit: BoxFit.contain,
                alignment: Alignment.topCenter)),
        child: Column(
          children: [
            SpacingManager.h48,
            Stack(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 4,
                      width: double.infinity,
                      child: Container(),
                    ),
                    Positioned(
                      bottom: 40.r,
                      left: 150.r,
                      child: Text(
                        fetchList[index].name,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                            color: AppColors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 19.sp),
                      ),
                      // alignment: Alignment.topCenter,
                    ),
                  ],
                ),
                const AppBarWidget(label: ''),
              ],
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    color: HexColors.blue10,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  shrinkWrap: true,
                  children: [
                    Text(
                      fetchList[index].description,
                      style: GoogleFonts.openSans(color: AppColors.white),
                    ),
                  ],
                ),
                // Your additional content goes here
              ),
            ),
          ],
        ),
      ),
    );
  }
}
