import 'package:yudiz_task/utils/common_import.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBgColor,
        primarySwatch: Colors.blueGrey,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
          color: AppColors.scaffoldBgColor,
          elevation: 0,
          iconTheme: const IconThemeData(color: AppColors.black),
          titleTextStyle: AppFontStyle.primaryS18W500,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
