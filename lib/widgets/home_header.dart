import '../utils/common_import.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(AppStrings.appName, style: AppFontStyle.normalS36W900),
          const Text(
            AppStrings.trendingProducts,
            style: AppFontStyle.normalS18W200,
          ),
          const SizedBox(
            height: 10,
          ),
          GetBuilder<HomeController>(
              init: HomeController(),
              builder: (controller) {
                return TextFormField(
                  onChanged: (value) {
                    controller.onSearch(value);
                  },
                  controller: controller.tcSearchController,
                  decoration: InputDecoration(
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    filled: true,
                    fillColor: AppColors.textFieldColor,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: AppStrings.search,
                    prefixIcon: const Icon(Icons.search),
                  ),
                );
              })
        ],
      ),
    );
  }
}