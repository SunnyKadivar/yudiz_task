import '../utils/common_import.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (context) {
        return Scaffold(
          body: Center(
            child: Text(
              AppStrings.appName,
              style: AppFontStyle.normalS30W900,
            ),
          ),
        );
      },
    );
  }
}
