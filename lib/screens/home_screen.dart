import '../utils/common_import.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeHeader(),
            Expanded(
              child: GetBuilder<HomeController>(
                id: 'list',
                builder: (controller) {
                  return controller.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : controller.products.isEmpty
                          ? const Center(
                              child: Text(AppStrings.dataNotFound),
                            )
                          : controller.tcSearchController.text.isNotEmpty
                              ? controller.searchProducts.isEmpty
                                  ? const Center(
                                      child: Text(AppStrings.searchNotFound),
                                    )
                                  : ListView.builder(
                                      cacheExtent: 30,
                                      physics: const BouncingScrollPhysics(),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 10),
                                      itemCount:
                                          controller.searchProducts.length,
                                      itemBuilder: (context, index) {
                                        var data =
                                            controller.searchProducts[index];
                                        bool isProductInCart = AppConst
                                            .cartProducts
                                            .contains(data);
                                        return ProductCard(
                                          data: data,
                                          isProductInCart: isProductInCart,
                                          onTap: isProductInCart
                                              ? null
                                              : () {
                                                  controller.onAddToCard(data);
                                                },
                                        );
                                      },
                                    )
                              : ListView.builder(
                                  cacheExtent: 30,
                                  physics: const BouncingScrollPhysics(),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 10),
                                  itemCount: controller.products.length,
                                  itemBuilder: (context, index) {
                                    var data = controller.products[index];
                                    bool isProductInCart =
                                        AppConst.cartProducts.contains(data);
                                    return ProductCard(
                                      data: data,
                                      isProductInCart: isProductInCart,
                                      onTap: isProductInCart
                                          ? null
                                          : () {
                                              controller.onAddToCard(data);
                                            },
                                    );
                                  },
                                );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FittedBox(
        child: Stack(
          alignment: const Alignment(1.4, -1.5),
          children: [
            GetBuilder<HomeController>(builder: (controller) {
              return FloatingActionButton(
                onPressed: () async {
                  if (AppConst.cartProducts.isNotEmpty) {
                    await Get.to(() => const CartScreen());
                    controller.tcSearchController.clear();
                    controller.update(['list', 'floatingButton']);
                  } else {
                    CommonMethod.showToast(AppStrings.addProduct);
                  }
                },
                backgroundColor: AppColors.purple,
                child: const Icon(Icons.shopping_cart_outlined),
              );
            }),
            GetBuilder<HomeController>(
                id: 'floatingButton',
                builder: (controller) {
                  return Visibility(
                    visible: AppConst.cartProducts.isNotEmpty,
                    child: Container(
                      padding: const EdgeInsets.symmetric(),
                      constraints:
                          const BoxConstraints(minHeight: 25, minWidth: 25),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 1,
                              blurRadius: 5,
                              color: Colors.black.withAlpha(50))
                        ],
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.orange,
                      ),
                      child: Center(
                        child: Text(
                          '${AppConst.cartProducts.length}',
                          style: AppFontStyle.normalW800,
                        ),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
