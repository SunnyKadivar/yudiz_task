import 'package:yudiz_task/utils/common_import.dart';

class HomeController extends GetxController{


  late TextEditingController _tcSearchController;
  List<Product> _products = [];
  List<Product> _searchProducts = [];
  bool _isLoading = false;

  TextEditingController get tcSearchController => _tcSearchController;
  List<Product> get products => _products;
  List<Product> get searchProducts => _searchProducts;
  bool get isLoading => _isLoading;


  @override
  void onInit() {
    // TODO: implement onInit
    _tcSearchController = TextEditingController();
    super.onInit();
    fetchProduct();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tcSearchController.dispose();
    super.dispose();
  }

  loading(bool value){
    _isLoading = value;
    update(['list']);
  }

  fetchProduct() async{
    loading(true);
    _products = await ApiServices.getProduct();
    loading(false);
  }

  onAddToCard(Product value){
    AppConst.cartProducts.add(value);
    update(['list','floatingButton']);
  }


  onSearch(String value){
    _searchProducts.clear();
    for(var data in _products){
      if(data.name.toString().toLowerCase().contains(value.toLowerCase())){
        _searchProducts.add(data);
      }
    }
    update(['list','floatingButton']);
  }

}