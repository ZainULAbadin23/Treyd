import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/gestures.dart';
import 'package:get_storage/get_storage.dart';
import 'package:treyd_crypto/routes/app_pages.dart';
import 'package:treyd_crypto/routes/app_routes.dart';
import 'package:treyd_crypto/services/initial_setting_service.dart';
Future<void> _initServices() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await GetStorage.init();
  await Get.putAsync(() => InitialSettingService().init());
}
void main() async {
  await _initServices();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return ScreenUtilInit(
      designSize: size,
      useInheritedMediaQuery: true,
      child: SimpleBuilder(builder: (context) {
        return GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: GetMaterialApp(
            scrollBehavior:
            const MaterialScrollBehavior().copyWith(dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            }),
            title: '',
            debugShowCheckedModeBanner: false,
            defaultTransition: Transition.fade,
            initialRoute: Routes.INITIAL,
            getPages: AppPages.pages,
            themeMode: Get.find<InitialSettingService>().getThemeMode(),
            theme: Get.find<InitialSettingService>().getLightTheme(),
            darkTheme: Get.find<InitialSettingService>().getDarkTheme(),
          ),
        );
      }),
    );
  }
}

