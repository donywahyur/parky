import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parky/app/data/constant.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.checkLogin();
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/logo.png'),
            width: 200,
          ),
          ShaderMask(
            shaderCallback: (bounds) {
              return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [kBlue, kGreen]).createShader(bounds);
            },
            child: Text(
              'Parky',
              style: kHeading5.copyWith(
                fontSize: 30,
                color: Colors.white,
                fontFamily: GoogleFonts.codaCaption().fontFamily,
              ),
            ),
          )
        ],
      )),
    );
  }
}
