import 'dart:async';

import '../utils/common_import.dart';

class SuccessController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    backToHome();
  }

  backToHome(){
    Timer(const Duration(seconds: 3), () {
      AppConst.cartProducts.clear();
      Get.offAll(()=>const HomeScreen());
    });
  }

}