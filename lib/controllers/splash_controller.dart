import 'dart:async';

import 'package:yudiz_task/utils/common_import.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    navigateToHome();
  }

  navigateToHome() {
    Timer(const Duration(seconds: 2), () {
      Get.to(() => const HomeScreen());
    });
  }
}
