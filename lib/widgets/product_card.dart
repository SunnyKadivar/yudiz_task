import '../utils/common_import.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    super.key,
    required this.data,
    required this.isProductInCart,
    required this.onTap,
  });

  final Product data;
  final bool isProductInCart;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: AppColors.listCardBgColor,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            padding: const EdgeInsets.all(6),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                color: AppColors.scaffoldBgColor,
                borderRadius: BorderRadius.circular(10)),
            child: CachedNetworkImage(
                memCacheHeight: 400,
                height: 74,
                width: 74,
                fit: BoxFit.cover,
                imageUrl: data.image ?? ' ',
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Center(
                  child: Icon(
                    Icons.error,
                    color: AppColors.black,
                  ),
                )),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name,
                  style: AppFontStyle.normalW800,
                ),
                Text(
                  data.description,
                  style: AppFontStyle.normalS10W300,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${AppConst.currency} ${data.price}',
                      style: AppFontStyle.normalW800,
                    ),
                    InkWell(
                      onTap: onTap,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 6),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                spreadRadius: 1,
                                blurRadius: 1,
                              )
                            ],
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
                          isProductInCart
                              ? Icons.check
                              : Icons.add_shopping_cart,
                          color: AppColors.white,
                          size: 16,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}