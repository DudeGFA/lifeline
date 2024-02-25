import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifeline/core/constant/color.dart';
import 'package:lifeline/core/routes/route_generator.dart';
import 'package:lifeline/features/presentation/pages/emergency_practitioner.dart/state/callId_state.dart';
import 'package:lifeline/features/presentation/pages/nearby_hospiatal/view/map_view.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class DeclareEmergency extends ConsumerWidget {
  const DeclareEmergency({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final res = ref.watch(callIdStateNotifer);
    return res.when(
        data: (data) {
          return Stack(
            children: [
              ZegoUIKitPrebuiltCall(
                  userID: 'afghar12',
                  userName: 'Unknown',
                  appID: int.parse(data.appId),
                  appSign: data.appSignIn,
                  callID: '1as267',
                  config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
                    ..turnOnCameraWhenJoining = true
                    ..turnOnMicrophoneWhenJoining = true
                    ..video = ZegoUIKitVideoConfig.preset1080P()
                    ..bottomMenuBar = ZegoCallBottomMenuBarConfig(buttons: [
                      // ZegoCallMenuBarButtonName.chatButton,
                      // ZegoCallMenuBarButtonName.hangUpButton,
                      // ZegoCallMenuBarButtonName.showMemberListButton
                    ])),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 12),
                          // height: 50.h,
                          // width: 50.w,
                          decoration: BoxDecoration(
                              color: AppColors.blueGrey,
                              borderRadius: BorderRadius.circular(1000)),
                          child: Icon(
                            Icons.chat_outlined,
                            color: HexColors.blue10,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          // height: 50.h,
                          // width: 50.w,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(1000)),
                          child: Icon(
                            Icons.call_end,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          AppRoute.displayBottomSheet(context, MapView());
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          // height: 50.h,
                          // width: 50.w,
                          decoration: BoxDecoration(
                              color: AppColors.blueGrey,
                              borderRadius: BorderRadius.circular(1000)),
                          child: Icon(
                            Icons.my_location_rounded,
                            color: HexColors.blue10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        error: (e, s) => Text(e.toString()),
        loading: () => const Center(
              child: CircularProgressIndicator.adaptive(),
            ));
  }
}
