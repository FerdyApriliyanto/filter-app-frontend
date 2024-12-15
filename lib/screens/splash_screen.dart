import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:filter_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('lib/assets/app-logo.png'),
      logoWidth: 160,
      showLoader: true,
      loadingText: const Text("Loading..."),
      navigator: HomeScreen(),
      durationInSeconds: 3,
    );
  }
}
