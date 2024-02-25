import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifeline/core/constant/color.dart';
import 'package:lifeline/core/routes/route_generator.dart';
import 'package:lifeline/features/presentation/pages/splash_screen/splash_screen.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

// void main() {

  
//   runApp(const ProviderScope(child: MyApp()));
// }


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// 1.1.2: set navigator key to ZegoUIKitPrebuiltCallInvitationService
  ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(AppRoute.navigatorKey!);

  // call the useSystemCallingUI
  ZegoUIKit().initLog().then((value) {
    ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI(
      [ZegoUIKitSignalingPlugin()],
    );

   runApp(const ProviderScope(child: MyApp()));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 1032),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, ctx) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'LifeLine',
          navigatorKey: AppRoute.navigatorKey,
          scaffoldMessengerKey: AppRoute.scaffoldMessengerKey,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: HexColors.blue10),
            useMaterial3: true,
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}
