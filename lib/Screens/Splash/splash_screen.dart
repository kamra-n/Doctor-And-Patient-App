import 'dart:async';

// import 'package:al_imran/constants/app_consts.dart';
import 'package:devathone/constants/app_constants.dart';
import 'package:devathone/constants/app_images_constant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Future<void> checkUserLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? role = prefs.getString('role');
    if (role != null) {
      print('role is $role');
      if (role == 'Doctor') {
        // ignore: use_build_context_synchronously
        Navigator.pushNamedAndRemoveUntil(
            context, '/doctorDashboard', (_) => false);
      } else {
        // ignore: use_build_context_synchronously
        Navigator.pushNamedAndRemoveUntil(
            context, '/patientDashboard', (_) => false);
      }
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
    }
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      checkUserLogin();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Appcolors.secondaryColor,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.logoImage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
