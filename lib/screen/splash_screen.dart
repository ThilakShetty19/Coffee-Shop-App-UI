import 'package:coffee_app_ui/utils/assets.dart';
import 'package:coffee_app_ui/screen/onboard_page.dart';
import 'package:coffee_app_ui/utils/color_pallette.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OnboardPage(),
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.coffeeSelected,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetImages.spalshImage),
            colorFilter: ColorFilter.mode(
              Colors.white,
              BlendMode.srcATop,
            ),
          ),
        ),
      ),
    );
  }
}
