import 'package:yudiz_task/utils/common_import.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.cart),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: GetBuilder<CartController>(
          id: 'list',
          init: CartController(),
          builder: (controller) {
            return ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                itemCount: AppConst.cartProducts.length,
                itemBuilder: (context, index) {
                  var data = AppConst.cartProducts[index];
                  return ListTile(
                    leading: const Icon(
                      Icons.check,
                      color: AppColors.primary,
                    ),
                    title: Text(
                      data.name,
                      style: AppFontStyle.normalS14,
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        controller.onRemoveProductFromCart(data);
                      },
                      icon: const Icon(
                        Icons.do_not_disturb_on_outlined,
                        color: AppColors.primary,
                      ),
                    ),
                  );
                });
          }),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GetBuilder<CartController>(
          id: 'floating',
          builder: (controller) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${AppConst.currency}${controller.total.toStringAsFixed(0)}',
                  style: AppFontStyle.blueS30,
                ),
                BuyButton(
                  onTap: () {
                    Get.to(() => const SuccessScreen());
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}


