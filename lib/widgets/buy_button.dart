import '../utils/common_import.dart';

class BuyButton extends StatelessWidget {
  BuyButton({
    super.key,
    required this.onTap,
  });

  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                blurRadius: 5,
                color: Colors.black.withAlpha(50))
          ],
        ),
        child: const Text(
          AppStrings.buy,
          style: AppFontStyle.whiteS14,
        ),
      ),
    );
  }
}