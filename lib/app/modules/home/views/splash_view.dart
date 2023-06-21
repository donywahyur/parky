import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 280.h,
      padding: const EdgeInsets.all(10),
      child: Image.asset('assets/car.png'),
    );
  }
}
