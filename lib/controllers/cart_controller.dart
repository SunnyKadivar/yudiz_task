import 'package:yudiz_task/utils/common_import.dart';

class CartController extends GetxController{

  double _total = 0;

  double get total => _total;

  @override
  onInit(){
    super.onInit();
    calculateTotal();
  }

  onRemoveProductFromCart(Product value){
    AppConst.cartProducts.removeWhere((element) => value == element);
    calculateTotal();
    update(['list','floating']);
  }

  calculateTotal(){
    _total=0;
    for(var data in AppConst.cartProducts){
      _total += data.price;
    }
    update(['floating']);
    if(AppConst.cartProducts.isEmpty){
      Get.back();
    }
  }

}