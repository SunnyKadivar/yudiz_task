import 'package:lottie/lottie.dart';
import '../utils/common_import.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SuccessController>(
      init: SuccessController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.success,style: AppFontStyle.normalS14W800,),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: Center(
            child: Lottie.asset(AppImages.success),
          ),
        );
      }
    );
  }
}
